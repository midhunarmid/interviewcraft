import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewcraft/core/data/models/auth_user_model.dart';
import 'package:interviewcraft/core/data/models/plain_response_model.dart';
import 'package:interviewcraft/core/domain/usecases/authentication.dart';
import 'package:interviewcraft/core/presentation/utils/constants.dart';
import 'package:interviewcraft/core/presentation/utils/functions.dart';
import 'package:interviewcraft/core/presentation/utils/message_generator.dart';
import 'package:interviewcraft/core/presentation/utils/my_app_exception.dart';
import 'package:get_it/get_it.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      try {
        appLogger.i(event);
        if (event is AuthSignInEvent) {
          if (!UtilFunctions.isEmailValid(event.email)) {
            handleError(
              emit,
              "Invalid Email",
              "Oops! It seems like the email you entered is invalid. Please double-check and try again.",
            );
            return;
          } else if (event.password.trim().isEmpty) {
            handleError(
              emit,
              "Password Required",
              "Uh-oh! Looks like you forgot to enter your password. Please provide your password to sign in.",
            );
            return;
          }

          emit.call(
            LoadingState(
              LoadingInfo(
                icon: LoadingIconEnum.submitting,
                title: MessageGenerator.getLabel("Signing In"),
                message: MessageGenerator.getMessage(
                    "Please wait while we sign in to the system."),
              ),
            ),
          );

          AuthenticationUseCase getUserProfileUseCase =
              GetIt.instance<AuthenticationUseCase>();

          AuthUserModel authUserModel = await getUserProfileUseCase
              .authenticateUser(event.email, event.password);
          await delayedEmit(emit, AuthSignedInState(authUserModel));
        } else if (event is AuthSignUpEvent) {
          if (!UtilFunctions.isNameValid(event.name)) {
            handleError(
              emit,
              "Invalid Name",
              "It seems like the name you entered is invalid. Please use only letters and ensure it's correctly formatted.",
            );
            return;
          } else if (event.domain.trim().isEmpty) {
            handleError(
              emit,
              "Domain Required",
              "Oops! Please enter your specialization or domain to proceed. It's essential for us to craft better interview questions for you.",
            );
            return;
          } else if (!UtilFunctions.isEmailValid(event.email)) {
            handleError(
              emit,
              "Invalid Email",
              "Oops! It seems like the email you entered is invalid. Please double-check and try again.",
            );
            return;
          } else if (!UtilFunctions.isPasswordValid(event.password)) {
            handleError(
              emit,
              "Password Requirements Not Met",
              "Oh no! Your password must include at least one uppercase letter, one lowercase letter, one number, and be at least six characters long. Please adjust and try again.",
            );
            return;
          } else if (event.password != event.confirmPassword) {
            handleError(
              emit,
              "Passwords Don't Match",
              "Oops! The passwords you entered don't match. Please make sure they match and try again.",
            );
            return;
          }

          emit.call(
            LoadingState(
              LoadingInfo(
                icon: LoadingIconEnum.submitting,
                title: MessageGenerator.getLabel("Creating Account"),
                message: MessageGenerator.getMessage(
                    "Hang tight! We're registering you into our system. This won't take long."),
              ),
            ),
          );

          AuthenticationUseCase getUserProfileUseCase =
              GetIt.instance<AuthenticationUseCase>();

          AuthUserModel authUserModel =
              await getUserProfileUseCase.registerUser(
                  event.email,
                  event.password,
                  event.confirmPassword,
                  event.name,
                  event.domain);
          await delayedEmit(emit, AuthSignedInState(authUserModel));
        }
      } on MyAppException catch (ae) {
        appLogger.e(ae);
        await delayedEmit(
          emit,
          AuthErrorState(
            MessageGenerator.getMessage(ae.title),
            MessageGenerator.getMessage(ae.message),
            StatusInfoIconEnum.error,
          ),
        );
      } catch (e) {
        appLogger.e(e);
        await delayedEmit(
          emit,
          AuthErrorState(
            MessageGenerator.getMessage("un-expected-error"),
            MessageGenerator.getMessage("un-expected-error-message"),
            StatusInfoIconEnum.error,
          ),
        );
      }
    });
  }

  Future<void> delayedEmit(
      Emitter<AuthenticationState> emitter, AuthenticationState state) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emitter.call(state);
  }

  handleError(
      Emitter<AuthenticationState> emitter, String title, String message) {
    emitter.call(
      AuthErrorState(
        MessageGenerator.getMessage(title),
        MessageGenerator.getMessage(message),
        StatusInfoIconEnum.error,
      ),
    );
  }
}
