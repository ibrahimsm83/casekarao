import 'package:casekarao/app/app.dart';
import 'package:casekarao/controller/user_role_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize the UserRoleController
  Get.put(UserRoleController());

  runApp(MyApp());
}
