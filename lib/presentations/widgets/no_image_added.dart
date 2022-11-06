import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gellary_task/shared/constants/colors.dart';

class NoImagesAddedText extends StatelessWidget {
  const NoImagesAddedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Text(
          'No images has been added yet',
          style: TextStyle(fontSize: 20.sp, color: ColorsApp.textGrey),
        ),
      ),
    );
  }
}
