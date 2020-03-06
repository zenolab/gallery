class Url {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Url({this.raw, this.full, this.regular, this.small, this.thumb});

  Url.fromJson(Map<String, dynamic> json) {
    this.raw = json['raw'];
    this.full = json['full'];
    this.regular = json['regular'];
    this.small = json['small'];
    this.thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}