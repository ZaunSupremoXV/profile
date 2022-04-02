import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/app/pages/home/home_page.dart';
import 'package:profile/app/repository/hive_user_repository.dart';
import 'package:profile/app/viewmodels/sign_in_viewmodel.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../models/user_model.dart';

class SignInController {
  late SignInViewModel viewModel;
  BuildContext context;
  final RxNotifier<bool> _loading = RxNotifier<bool>(false);
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  final _formKey = GlobalKey<FormState>();
  GlobalKey get formKey => _formKey;

  SignInController(this.context) {
    HiveUserRepository repository = HiveUserRepository();
    viewModel = SignInViewModel(repository);
  }

  //! instancia o controller dos inputs dos forms
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  //! validadores dos inputs
  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Email cannot be empty.";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Email is not valid.";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password cannot be empty.";
    }
    return null;
  }

  //! chama a funcao signIn do viewModel
  signIn() async {
    if (_formKey.currentState!.validate()) {
      loading = true;
      try {
        UserModel data = await viewModel.signIn(email.text, password.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(userModel: data)),
        );
      } catch (e) {
        return e;
      } finally {
        loading = false;
      }
    }
  }
}
