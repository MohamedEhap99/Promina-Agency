import 'package:flutter/material.dart';

class Cliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 180, 0);
    path.quadraticBezierTo(
      size.width - 120,
      0,
      size.width - 120,
      60,
    );
    path.quadraticBezierTo(
      size.width - 120,
      120,
      size.width - 60,
      120,
    );
    path.quadraticBezierTo(
      size.width,
      120,
      size.width,
      180,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(
      0,
      size.height,
    );
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
