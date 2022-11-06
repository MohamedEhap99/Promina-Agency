import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onpressed;
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const CustomButton({
    super.key,
    required this.onpressed,
    this.text,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Text(
        text!.toUpperCase(),
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
