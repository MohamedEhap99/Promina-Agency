import 'package:flutter/material.dart';
import 'package:gellary_task/data/web_services/remote/dio_helper.dart';
import 'package:gellary_task/data/web_services/remote/hive_helper.dart';
import 'package:gellary_task/presentations/screens/gallery.dart';
import 'package:gellary_task/presentations/screens/login.dart';
import 'package:gellary_task/shared/routes/routes.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    late bool isLoggedIn;
  @override
  void initState() {
    if (HiveHelper.isTokenExists()) {
      DioHelper.setToken(HiveHelper.returnToken());
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
       Future.delayed(const Duration(seconds: 4), () {
      RouteManager.replaceUntilOrAll(
          isLoggedIn ? RouteManager.home : RouteManager.login);
    });
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: isLoggedIn ? const GalleryScreen() : LoginScreen(),
        duration: 2000,
        imageSize: 130,
        text: "ProMina Agency",
        textType: TextType.TyperAnimatedText,
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
