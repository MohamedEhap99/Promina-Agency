import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gellary_task/data/model/gallery_image_model.dart';

class GalleryImageGridViewItem extends StatelessWidget {
  const GalleryImageGridViewItem({super.key, required this.galleryImageModel});
  final GalleryImageModel galleryImageModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.w,
      width: 108.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(galleryImageModel.link),
        ),
      ),
    );
  }
}
