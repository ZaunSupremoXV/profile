import 'package:flutter/material.dart';
import 'package:profile/app/pages/login/sign_in_controller.dart';
import 'package:profile/app/pages/sign_up/sign_up_page.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late SignInController controller;

  @override
  void initState() {
    controller = SignInController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: RxBuilder(builder: (context) {
        return Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/login.png",
                    height: 240.0,
                    width: 240.0,
                  ),
                ),
                const Text("Email"),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.email,
                  validator: controller.emailValidator,
                ),
                const Text("Password"),
                TextFormField(
                  obscureText: true,
                  controller: controller.password,
                  validator: controller.passwordValidator,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.loading ? null : controller.signIn();
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
                          : const Text("Sign In"),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
