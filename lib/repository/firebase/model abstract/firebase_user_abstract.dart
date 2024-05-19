import '../../../Models/user_model.dart';

abstract class FirebaseUserAbstract {
  Future<String> create(UserModel user);
  Future<String> delete(String id);
  Future<String> update(UserModel userModel);
  Future<UserModel> read(String id);
}
