import 'dart:math';

import 'package:interviewcraft/core/data/models/auth_user_model.dart';
import 'package:interviewcraft/core/presentation/utils/message_generator.dart';
import 'package:interviewcraft/core/presentation/utils/my_app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteDataSource {
  Future<AuthUserModel> authenticateUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential);
      AuthUserModel authUserModel = AuthUserModel(
        email: credential.user?.email,
      );
      return authUserModel;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        throw MyAppException(
            title: MessageGenerator.getMessage("User Not Found"),
            message: MessageGenerator.getMessage(
                "User not found. Check details or sign up. Need help? Contact support."));
      } else if (e.code == 'invalid-credential') {
        throw MyAppException(
            title: MessageGenerator.getMessage("Invalid Credentials"),
            message: MessageGenerator.getMessage(
                "Uh-oh! Looks like your credentials are incorrect. Double-check and try again. Need assistance? Contact support."));
      } else {
        throw MyAppException(
            title: MessageGenerator.getMessage("Unexpected Error"),
            message: MessageGenerator.getMessage("Please try again later."));
      }
    } on Exception catch (e) {
      print(e);
      throw MyAppException(
          title: MessageGenerator.getMessage("Unexpected Error"),
          message: MessageGenerator.getMessage("Please try again later."));
    }
  }
}
