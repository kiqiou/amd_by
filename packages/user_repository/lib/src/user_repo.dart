import 'models/models.dart';

abstract class UserRepository {
  Stream<MyUser?> get user;

  Future<MyUser> singUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser user);

  Future<void> singIn(String email, String password);

  Future<void> logOut();
}