import 'package:casekarao/app/app.dart';
import 'package:casekarao/controller/user_role_controller.dart';
// import 'package:casekarao/core/network/network_manager.dart';
// import 'package:casekarao/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/network/network_managers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(NetworkManagers());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize the AppHelper
  //await AppHelper.init();

  // Initialize the UserRoleController and set its value from AppHelper
  // final userRoleController = Get.put(UserRoleController());
  //userRoleController.isUser = AppHelper.isUser;
 Get.put(UserRoleController());
 
 runApp(MyApp());
}
