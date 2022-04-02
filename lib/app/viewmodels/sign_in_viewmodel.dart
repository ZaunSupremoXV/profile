import 'package:profile/app/interfaces/user_repository_interface.dart';

import '../models/user_model.dart';

class SignInViewModel {
  final IUserRepository repository;

  SignInViewModel(this.repository);

  signIn(String email, String password) async {
    try {
      UserModel? data = await repository.get(email);
      if (data!.password == password) {
        print('Senha igual');
        return data;
      } else {
        print('Senha errada');
      }
      ;
    } catch (e) {
      return e;
    }
  }
}
