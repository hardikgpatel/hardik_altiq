class FeedResponseModel {
  List<FeedModel> feeds;
  bool success;

  FeedResponseModel({this.feeds, this.success});

  FeedResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      feeds = new List<FeedModel>();
      json['data'].forEach((v) {
        feeds.add(new FeedModel.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feeds != null) {
      data['data'] = this.feeds.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class FeedModel {
  int id;
  String url;
  String time;
  int likes;
  int comments;
  bool hasLiked;
  String username;
  String description;
  bool hasCommented;

  FeedModel(
      {this.id,
      this.url,
      this.time,
      this.likes,
      this.comments,
      this.hasLiked,
      this.username,
      this.description,
      this.hasCommented});

  FeedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    time = json['time'];
    likes = json['likes'];
    comments = json['comments'];
    hasLiked = json.containsKey('hasLiked') ? json['hasLiked'] == 1 : false;
    username = json['username'];
    hasCommented =
        json.containsKey('hasCommented') ? json['hasCommented'] == 1 : false;
    description = json['description'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['time'] = this.time;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['hasLiked'] = this.hasLiked;
    data['username'] = this.username;
    data['hasCommented'] = this.hasCommented;
    return data;
  }

  updateLike() {
    hasLiked = !hasLiked;
  }

  updateComment() {
    hasCommented = !hasCommented;
  }
}
