import 'package:flutter/material.dart';
import 'package:gellary_task/shared/routes/routes.dart';

void snackBar(String message, {bool isError = true}) {
  ScaffoldMessenger.of(RouteManager.navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      dismissDirection: DismissDirection.vertical,
    ),
  );
}
