import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final VoidCallback? onpressed;
  final Widget childWidget;
  final EdgeInsets? margin;
  final Color? color;
  final Color borderColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? icon;
  const CustomButton2(
      {super.key,
      this.onpressed,
      required this.childWidget,
      this.color,
      this.margin,
      this.width,
      this.height,
      this.fontSize,
      this.radius = 0,
      this.icon,
      this.borderColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: margin,
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: color ?? borderColor),
            borderRadius:
                radius != null ? BorderRadius.circular(radius!) : null),
        child: Center(child: childWidget),
      ),
    );
  }
}