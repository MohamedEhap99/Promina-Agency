abstract class GalleryState {}

class GalleryInitialState extends GalleryState {}

class GalleryImagesLoadingState extends GalleryState {}

class GalleryImagesLoadingFailState extends GalleryState {
  final String message;

  GalleryImagesLoadingFailState(this.message);
}

class GalleryImagesLoadedState extends GalleryState {}

class GalleryImagesUploadingState extends GalleryState {}

class GalleryImagesUploadSuccessState extends GalleryState {
  final String message;

  GalleryImagesUploadSuccessState(this.message);
}

class GalleryImagesUploadFailedState extends GalleryState {
  final String message;

  GalleryImagesUploadFailedState(this.message);
}
