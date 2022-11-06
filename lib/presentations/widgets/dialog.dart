import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gellary_task/business_logic/gallery_cubit/gallery_cubit.dart';
import 'package:gellary_task/business_logic/gallery_cubit/gallery_state.dart';
import 'package:gellary_task/presentations/widgets/custom_button2.dart';
import 'package:gellary_task/presentations/widgets/loading.dart';
import 'package:gellary_task/presentations/widgets/snack_bar.dart';
import 'package:gellary_task/shared/constants/colors.dart';
import 'package:gellary_task/shared/constants/images.dart';
import 'package:image_picker/image_picker.dart';

class UploadDialog extends StatelessWidget {
  const UploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    GalleryCubit cubit = BlocProvider.of<GalleryCubit>(context);
    return BlocConsumer<GalleryCubit, GalleryState>(listener: (context, state) {
      if (state is GalleryImagesUploadSuccessState) {
        snackBar(state.message, isError: false);
        Navigator.pop(context);
      } else if (state is GalleryImagesUploadFailedState) {
        snackBar(state.message);
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image;

      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 42.sp),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.sp),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsApp.white),
                  color: ColorsApp.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(
                    32.sp,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: state is GalleryImagesUploadingState
                      ? [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(85.sp, 49.sp, 85.sp, 22.sp),
                            child: const Loading(),
                          )
                        ]
                      : [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(85.sp, 49.sp, 85.sp, 22.sp),
                            child: CustomButton2(
                              onpressed: () async {
                                image = await imagePicker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  cubit.uploadImage(File(image!.path));
                                }
                              },
                              radius: 16.sp,
                              height: 65.h,
                              color: ColorsApp.white,
                              childWidget: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.sp, vertical: 6.sp),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Images.gallery,
                                    ),
                                    Text(
                                      'Gallery',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: ColorsApp.textGrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(85.sp, 22.sp, 85.sp, 49.sp),
                            child: CustomButton2(
                              onpressed: () async {
                                image = await imagePicker.pickImage(
                                    source: ImageSource.camera);
                                if (image != null) {
                                  cubit.uploadImage(File(image!.path));
                                }
                              },
                              radius: 16.sp,
                              height: 65.h,
                              color: ColorsApp.white,
                              childWidget: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.sp, vertical: 6.sp),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Images.camera,
                                    ),
                                    Text(
                                      'Camera',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: ColorsApp.textGrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
