import 'package:online_gallery/domain/models/photo.dart';

abstract class GalleryState {
  const GalleryState();
}

class InitialGalleryState extends GalleryState {}

class GalleryError extends GalleryState {}

class GalleryLoaded extends GalleryState {
  final List<Photo> photos;

  GalleryLoaded(this.photos);

  GalleryLoaded copyWith(List<Photo> photos) {
    return GalleryLoaded(photos);
  }
}
