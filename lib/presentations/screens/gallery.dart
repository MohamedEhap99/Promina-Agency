import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gellary_task/business_logic/gallery_cubit/gallery_cubit.dart';
import 'package:gellary_task/business_logic/gallery_cubit/gallery_state.dart';
import 'package:gellary_task/presentations/widgets/cliper.dart';
import 'package:gellary_task/presentations/widgets/gallery_home.dart';
import 'package:gellary_task/presentations/widgets/loading.dart';
import 'package:gellary_task/presentations/widgets/no_image_added.dart';
import 'package:gellary_task/presentations/widgets/small_button.dart';
import 'package:gellary_task/shared/constants/colors.dart';
import 'package:gellary_task/shared/constants/images.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GalleryCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Images.loginBackgroundGredient,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: BlocConsumer<GalleryCubit, GalleryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipPath(
                          clipper: Cliper(),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorsApp.white.withOpacity(0.4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 27.sp,
                                      top: MediaQuery.of(context)
                                              .viewPadding
                                              .top +
                                          35.sp),
                                  child: Text(
                                    'Welcome\nMina',
                                    style: TextStyle(
                                        color: ColorsApp.textGrey,
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SmallButton(),
                                Flexible(
                                  child: state is GalleryImagesLoadingState
                                      ? const Loading()
                                      : cubit.images.isEmpty
                                          ? const NoImagesAddedText()
                                          : GridView.builder(
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(
                                                      parent:
                                                          BouncingScrollPhysics()),
                                              padding: EdgeInsets.all(24.sp),
                                              itemCount: cubit.images.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisSpacing: 25.sp,
                                                      crossAxisSpacing: 24.sp,
                                                      crossAxisCount: 3),
                                              itemBuilder: (context, index) =>
                                                  GalleryImageGridViewItem(
                                                galleryImageModel:
                                                    cubit.images[index],
                                              ),
                                            ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
