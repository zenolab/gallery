import 'package:online_gallery/domain/models/link.dart';
import 'package:online_gallery/domain/models/url.dart';
import 'package:online_gallery/domain/models/user.dart';
import 'boilerplate/sponsorship.dart';

class Photo {
  String id;
  String createdAt;
  String updatedAt;
  String color;
  String altDescription;
  bool likedByUser;
  int width;
  int height;
  int likes;
  Link links;
  Sponsorship sponsorship;
  Url urls;
  User user;

  Photo(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.color,
        this.altDescription,
        this.likedByUser,
        this.width,
        this.height,
        this.likes,
        this.links,
        this.sponsorship,
        this.urls,
        this.user});

  Photo.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.createdAt = json['created_at'];
    this.updatedAt = json['updated_at'];
    this.color = json['color'];
    this.altDescription = json['alt_description'];
    this.likedByUser = json['liked_by_user'];
    this.width = json['width'];
    this.height = json['height'];
    this.likes = json['likes'];
    this.links =
    json['links'] != null ? Link.fromJson(json['links']) : null;
    this.sponsorship = json['sponsorship'] != null
        ? Sponsorship.fromJson(json['sponsorship'])
        : null;
    this.urls = json['urls'] != null ? Url.fromJson(json['urls']) : null;
    this.user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['color'] = this.color;
    data['alt_description'] = this.altDescription;
    data['liked_by_user'] = this.likedByUser;
    data['width'] = this.width;
    data['height'] = this.height;
    data['likes'] = this.likes;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.sponsorship != null) {
      data['sponsorship'] = this.sponsorship.toJson();
    }
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}