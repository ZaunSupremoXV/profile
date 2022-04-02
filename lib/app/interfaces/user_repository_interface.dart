import 'package:profile/app/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel?> get(String email);
  Future<UserModel> post(UserModel userModel);
}
