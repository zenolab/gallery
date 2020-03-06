
class Link {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  Link(
      {this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers});

  Link.fromJson(Map<String, dynamic> json) {
    this.self = json['self'];
    this.html = json['html'];
    this.photos = json['photos'];
    this.likes = json['likes'];
    this.portfolio = json['portfolio'];
    this.following = json['following'];
    this.followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    data['following'] = this.following;
    data['followers'] = this.followers;
    return data;
  }
}