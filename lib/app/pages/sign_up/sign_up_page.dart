import 'package:flutter/material.dart';
import 'package:profile/app/pages/sign_up/sign_up_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpController controller;

  @override
  void initState() {
    controller = SignUpController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: RxBuilder(builder: (context) {
        return Form(
          key: controller.formkey,
          child: ListView(
            children: [
              const Text("Name"),
              TextFormField(
                controller: controller.name,
                validator: controller.nameValidator,
              ),
              const Text("Email"),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.email,
                validator: controller.emailValidator,
              ),
              const Text("Password"),
              TextFormField(
                controller: controller.password,
                obscureText: true,
                validator: controller.passwordValidator,
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    controller.loading ? null : controller.signUp();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                    child: controller.loading
                        ? const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white)),
                          )
                        : const Text("Sign Up"),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
