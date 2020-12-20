class StoryResponseModel {
  List<StoryModel> stories;
  bool success;

  StoryResponseModel({this.stories, this.success});

  StoryResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      stories = new List<StoryModel>();
      json['data'].forEach((v) {
        stories.add(new StoryModel.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stories != null) {
      data['data'] = this.stories.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class StoryModel {
  String name;
  String profile;
  int userId;

  StoryModel({this.name, this.profile, this.userId});

  StoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profile = json['profile'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile'] = this.profile;
    data['user_id'] = this.userId;
    return data;
  }

}
