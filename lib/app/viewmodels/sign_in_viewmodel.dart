import 'package:profile/app/interfaces/user_repository_interface.dart';

import '../models/user_model.dart';

class SignInViewModel {
  final IUserRepository repository;

  SignInViewModel(this.repository);

  signIn(String email, String password) async {
    try {
      //! chama o repository e executa a funcao get
      UserModel? data = await repository.get(email);
      //! verifica se a senha recebida e a mesma da informacao armazenada
      if (data!.password == password) return data;
    } catch (e) {
      return e;
    }
  }
}
