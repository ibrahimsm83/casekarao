import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../presentation/resources/color_manager.dart';
import '../presentation/resources/export_resources.dart';


class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key); //default constractor

//Private named constractor
  MyApp._internal();

//Single Instance--Singleton
  static final MyApp instance = MyApp._internal();

//factory for the class instance
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CaseKarao',
            onGenerateRoute: CustomRouteGenerator.generateRoute,
            initialRoute: CustomRouteNames.kInitialRoute,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                unselectedWidgetColor: HexColor.fromHex("#303749")),
          );
        });
  }

  MaterialColor myappColor = const MaterialColor(
    0xFF27B0FF,
    <int, Color>{
      50: Color(0xFF27B0FF), //10%
      100: Color(0xFF27B0FF), //20%
      200: Color(0xFF27B0FF), //30%
      300: Color(0xFF27B0FF), //40%
      400: Color(0xFF27B0FF), //50%
      500: Color(0xFF27B0FF), //60%
      600: Color(0xFF27B0FF), //70%
      700: Color(0xFF27B0FF), //80%
      800: Color(0xFF27B0FF), //90%
      900: Color(0xFF27B0FF), //100%
    },
  );
}