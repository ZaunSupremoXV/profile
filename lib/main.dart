import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:profile/app/app_widget.dart';

import 'app/models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  runApp(const AppWidget());
}
