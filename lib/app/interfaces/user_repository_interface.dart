import 'package:profile/app/models/user_model.dart';

//! interface usada no projeto
abstract class IUserRepository {
  //! para requisicoes
  Future<UserModel?> get(String email);
  //! para publicacoes
  Future<UserModel> post(UserModel userModel);
}
