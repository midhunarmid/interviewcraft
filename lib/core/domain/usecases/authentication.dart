import 'package:interviewcraft/core/data/models/auth_user_model.dart';
import 'package:interviewcraft/core/domain/repositories/user_repository.dart';

class AuthenticationUseCase {
  final UserRepository _userRepository;

  AuthenticationUseCase(this._userRepository);

  Future<AuthUserModel> authenticateUser(String email, String password) async {
    return await _userRepository.authenticateUser(email, password);
  }

  Future<AuthUserModel> registerUser(String email, String password,
      String confirmPassword, String name, String domain) async {
    return await _userRepository.registerUser(
        email, password, confirmPassword, name, domain);
  }
}
