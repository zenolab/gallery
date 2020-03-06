import 'dart:io';
import 'package:online_gallery/domain/models/photo.dart';


class GalleryResponse {
  final List<Photo> results;

  GalleryResponse(this.results);

  GalleryResponse.fromJsonArray(List json)
      : results = json.map((i) => new Photo.fromJson(i)).toList();
}




