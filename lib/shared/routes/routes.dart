import 'package:flutter/material.dart';
import 'package:gellary_task/presentations/screens/gallery.dart';
import 'package:gellary_task/presentations/screens/login.dart';

navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => Widget), (route) {
      return false;
    });

class RouteManager {
  RouteManager._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Future<dynamic> goTo(String routeName) async {
    return await navigatorKey.currentState!.pushNamed(routeName);
  }

  static Future<dynamic> replace(String routeName) async {
    return await navigatorKey.currentState!.pushReplacementNamed(
      routeName,
    );
  }

  static Future<dynamic> replaceUntilOrAll(String routeName,
      {String? until}) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName,
        (route) {
      if (until != null) {
        return route.settings.name == until;
      } else {
        return false;
      }
    });
  }

  static void pop([Object? result]) {
    navigatorKey.currentState!.pop(result);
  }

  static String splash = '/';
  static String home = '/home';
  static String login = '/login';

  static Map<String, WidgetBuilder> routes = {
    //splash: (BuildContext context) => const SplashScreen(),
    home: (BuildContext context) => const GalleryScreen(),
    login: (BuildContext context) => LoginScreen(),
  };
}
