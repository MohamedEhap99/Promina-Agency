import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gellary_task/shared/constants/colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitRotatingCircle(
        color: ColorsApp.bl,
        duration:  Duration(milliseconds: 500),
      ),
    );
  }
}
