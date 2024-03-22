part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthSignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthSignInEvent(this.email, this.password);
}

class AuthSignUpEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String domain;

  AuthSignUpEvent(
      this.email, this.password, this.confirmPassword, this.name, this.domain);
}
