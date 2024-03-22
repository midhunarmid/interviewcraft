import 'package:interviewcraft/core/data/datasources/remote_data_source.dart';
import 'package:interviewcraft/core/data/models/auth_user_model.dart';
import 'package:interviewcraft/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<AuthUserModel> authenticateUser(String email, String password) {
    return _remoteDataSource.authenticateUser(email, password);
  }

  @override
  Future<AuthUserModel> registerUser(String email, String password,
      String confirmPassword, String name, String domain) {
    return _remoteDataSource.registerUser(
        email, password, confirmPassword, name, domain);
  }
}
