import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_task/business_logic/gallery_cubit/gallery_state.dart';
import 'package:gellary_task/data/model/gallery_image_model.dart';
import 'package:gellary_task/data/web_services/remote/gallery_image_helper.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitialState());

  static GalleryCubit get(context) => BlocProvider.of(context);

  List<GalleryImageModel> images = [];
  Future<void> getImages() async {
    emit(GalleryImagesLoadingState());
    await GalleryImagesApiHelper.getImages().then((response) {
      if (response.data['status'] == 'success') {
        List imagesLinks = response.data['data']['images'];
        images = imagesLinks.map((link) => GalleryImageModel(link)).toList();
        emit(GalleryImagesLoadedState());
      } else {
        emit(GalleryImagesLoadingFailState(response.data['message']));
      }
    });
  }

  Future<void> uploadImage(File image) async {
    emit(GalleryImagesUploadingState());
    await GalleryImagesApiHelper.uploadImage(image).then((response) {
      if (response.data['status'] == 'success') {
        emit(GalleryImagesUploadSuccessState(response.data['message']));
        getImages();
      } else {
        emit(GalleryImagesUploadFailedState(response.data['message']));
      }
    });
  }
}
