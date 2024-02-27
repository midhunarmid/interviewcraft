import 'package:interviewcraft/core/data/models/auth_user_model.dart';

abstract class UserRepository {
  Future<AuthUserModel> authenticateUser(String email, String password);
}
