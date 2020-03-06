import 'package:online_gallery/domain/models/boilerplate/sponsor.dart';

class Sponsorship {
  String impressionsId;
  String tagline;
  Sponsor sponsor;
  List<String> impressionUrls;

  Sponsorship(
      {this.impressionsId, this.tagline, this.sponsor, this.impressionUrls});

  Sponsorship.fromJson(Map<String, dynamic> json) {
    this.impressionsId = json['impressions_id'];
    this.tagline = json['tagline'];
    this.sponsor =
    json['sponsor'] != null ? Sponsor.fromJson(json['sponsor']) : null;

    List<dynamic> impressionUrlsList = json['impression_urls'];
    this.impressionUrls = new List();
    this.impressionUrls.addAll(impressionUrlsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['impressions_id'] = this.impressionsId;
    data['tagline'] = this.tagline;
    if (this.sponsor != null) {
      data['sponsor'] = this.sponsor.toJson();
    }
    data['impression_urls'] = this.impressionUrls;
    return data;
  }
}