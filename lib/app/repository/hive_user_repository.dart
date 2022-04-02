import 'package:hive/hive.dart';
import 'package:profile/app/models/user_model.dart';
import 'package:profile/app/interfaces/user_repository_interface.dart';

class HiveUserRepository implements IUserRepository {
  @override
  Future<UserModel?> get(String email) async {
    //! chama o hive e seta tabela users
    var box = await Hive.openBox<UserModel>('users');
    //! busca na tabela users a data com o email recebido
    var data = box.get(email);
    return data;
  }

  @override
  Future<UserModel> post(UserModel userModel) async {
    //! chama o hive e seta tabela users
    var box = await Hive.openBox<UserModel>('users');
    //! cria a key com a informacao email e adiciona todas as informacoes recebedias
    box.put(userModel.email, userModel);
    return userModel;
  }
}
