import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:profile/app/models/user_model.dart';
import 'package:profile/app/repository/hive_user_repository.dart';
import 'package:profile/app/viewmodels/sign_in_viewmodel.dart';
import 'package:profile/app/viewmodels/sign_up_viewmodel.dart';

void main() {
  group("ApiAuthViewModel", () {
    WidgetsFlutterBinding.ensureInitialized();
    HiveUserRepository repository = HiveUserRepository();

    UserModel userMock = UserModel(
      name: 'Armando Pinto',
      email: 'test@test.com',
      password: '1234',
    );

    test('SignUp', () async {
      await Hive.initFlutter();
      Hive.registerAdapter(UserModelAdapter());
      SignUpViewModel signUpViewModel = SignUpViewModel(repository);
      expect(
          await signUpViewModel.signUp(
              'Armando Pinto', 'test@test.com', '1234'),
          isA<UserModel>());
    });

    test('SignIn', () async {
      SignInViewModel signInViewModel = SignInViewModel(repository);
      expect(await signInViewModel.signIn('test@test.com', '1234'),
          isA<UserModel>());
    });

    test('SignIn - incorrect password', () async {
      SignInViewModel signInViewModel = SignInViewModel(repository);
      expect(await signInViewModel.signIn('test@test.com', '1234546'), null);
    });
  });
}
