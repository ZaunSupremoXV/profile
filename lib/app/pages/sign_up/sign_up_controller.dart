import 'package:flutter/material.dart';
import 'package:profile/app/pages/login/sign_in_page.dart';
import 'package:profile/app/repository/hive_user_repository.dart';

import 'package:profile/app/viewmodels/sign_up_viewmodel.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SignUpController {
  BuildContext context;
  late SignUpViewModel viewModel;
  final RxNotifier<bool> _loading = RxNotifier<bool>(false);
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  final _formKey = GlobalKey<FormState>();
  GlobalKey get formkey => _formKey;

  SignUpController(this.context) {
    HiveUserRepository repository = HiveUserRepository();
    viewModel = SignUpViewModel(repository);
  }

  //!instancia o controller dos inputs dos forms
  TextEditingController name = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  //! validadores dos inputs
  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Name cannot be empty.";
    }
    return null;
  }

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

  //! chama a funcao signUp do viewModel
  signUp() async {
    if (_formKey.currentState!.validate()) {
      loading = true;
      try {
        await viewModel.signUp(name.text, email.text, password.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignIn()),
        );
      } catch (e) {
        return e;
      } finally {
        loading = false;
      }
    }
  }
}
