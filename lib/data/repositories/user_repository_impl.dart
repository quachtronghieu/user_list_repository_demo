import '../../models/user.dart';
import '../datasources/user_fake_datasource.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFakeDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<List<User>> getUsers() {
    return dataSource.getUsers();
  }
}