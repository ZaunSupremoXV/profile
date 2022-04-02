import 'package:hive/hive.dart';
import 'package:profile/app/models/user_model.dart';
import 'package:profile/app/interfaces/user_repository_interface.dart';

class HiveUserRepository implements IUserRepository {
  @override
  Future<UserModel?> get(String email) async {
    var box = await Hive.openBox<UserModel>('users');
    var data = box.get(email);
    // print('aqui mano');
    // print(data);
    return data;
  }

  @override
  Future<UserModel> post(UserModel userModel) async {
    var box = await Hive.openBox<UserModel>('users');
    // box.add(userModel);
    box.put(userModel.email, userModel);
    // print('aqui mani');
    // print(box.keys);
    return userModel;
  }
}
