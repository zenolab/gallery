import 'package:online_gallery/domain/models/boilerplate/profile.dart';

import '../link.dart';

class Sponsor {
  String id;
  String updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  String twitterUsername;
  String portfolioUrl;
  String bio;
  String instagramUsername;
  bool acceptedTos;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  Link links;
  ProfileImage profileImage;

  Sponsor(
      {this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.instagramUsername,
        this.acceptedTos,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.links,
        this.profileImage});

  Sponsor.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.updatedAt = json['updated_at'];
    this.username = json['username'];
    this.name = json['name'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.twitterUsername = json['twitter_username'];
    this.portfolioUrl = json['portfolio_url'];
    this.bio = json['bio'];
    this.instagramUsername = json['instagram_username'];
    this.acceptedTos = json['accepted_tos'];
    this.totalCollections = json['total_collections'];
    this.totalLikes = json['total_likes'];
    this.totalPhotos = json['total_photos'];
    this.links =
    json['links'] != null ? Link.fromJson(json['links']) : null;
    this.profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['instagram_username'] = this.instagramUsername;
    data['accepted_tos'] = this.acceptedTos;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage.toJson();
    }
    return data;
  }
}