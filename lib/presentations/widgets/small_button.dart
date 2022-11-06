import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gellary_task/business_logic/login_cubit/login_cubit.dart';
import 'package:gellary_task/presentations/screens/login.dart';
import 'package:gellary_task/presentations/widgets/custom_button.dart';
import 'package:gellary_task/presentations/widgets/custom_button2.dart';
import 'package:gellary_task/presentations/widgets/dialog.dart';
import 'package:gellary_task/shared/constants/colors.dart';
import 'package:gellary_task/shared/constants/images.dart';
import 'package:gellary_task/shared/routes/routes.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.sp)
          .copyWith(top: 48.sp, bottom: 34.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomButton2(
              onpressed: () {
                BlocProvider.of<LoginCubit>(context).logout().whenComplete(
                    () => navigateAndFinish(context, LoginScreen()));
              },
              radius: 16.sp,
              color: ColorsApp.white,
              childWidget: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.logout,
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      'log out',
                      style:
                          TextStyle(fontSize: 20.sp, color: ColorsApp.textGrey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50.w,
          ),
          Expanded(
            child: CustomButton2(
              onpressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) => const UploadDialog(),
                );
              },
              radius: 16.sp,
              color: ColorsApp.white,
              childWidget: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.upload,
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      'upload',
                      style:
                          TextStyle(fontSize: 20.sp, color: ColorsApp.textGrey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
