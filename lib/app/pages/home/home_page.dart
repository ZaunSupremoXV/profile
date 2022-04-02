import 'package:flutter/material.dart';
import 'package:profile/app/app_theme.dart';
import 'package:profile/app/models/user_model.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  UserModel userModel;
  HomePage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ListView(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              // "My name is ${widget.userModel.name}",
              "My name is ${widget.userModel.name}",
              style: AppStyle.nameText,
            ),
            Text("Contact: ${widget.userModel.email}"),
          ],
        ),
      ),
    );
  }
}
