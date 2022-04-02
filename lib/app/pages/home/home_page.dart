import 'package:flutter/material.dart';
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
        title: const Text("Home Page"),
      ),
      body: ListView(
        children: [
          Text("My name is ${widget.userModel.name}"),
          Text("Email ${widget.userModel.email}"),
        ],
      ),
    );
  }
}
