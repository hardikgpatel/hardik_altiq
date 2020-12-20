import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hardik_atliq/models/feed_response_model.dart';
import 'package:hardik_atliq/models/story_response_model.dart';
import 'package:hardik_atliq/services/http_service.dart';
import 'package:provider/provider.dart';

class FeedProvider with ChangeNotifier {
  FeedProvider();

  bool _isLoadingStory = true;

  bool get isLoadingStory => _isLoadingStory;

  bool _isLoadingFeed = true;

  bool get isLoadingFeed => _isLoadingFeed;

  List<StoryModel> _storyModel = [];

  List<StoryModel> get stories => _storyModel;

  List<FeedModel> _feedModel =[];

  List<FeedModel> get feeds => _feedModel;

  final HttpService _httpService = HttpService();

  factory FeedProvider.instance(BuildContext context, bool listen) =>
      Provider.of<FeedProvider>(context, listen: listen);

  getStories() async {
    final response = await _httpService.get(path: 'ccbb47f5899bbc9ed1f5');
    StoryResponseModel responseModel = StoryResponseModel.fromJson(jsonDecode(response.toString()));
    if(responseModel.success){
      _storyModel.clear();
      _storyModel.addAll(responseModel.stories);
    } else {
      print('Something went wrong');
    }
    _isLoadingStory = false;
    notifyListeners();
  }

  getFeeds() async{
    final resp = await _httpService.get(path: '902b05130ff4a34c74cd');
    FeedResponseModel responseModel = FeedResponseModel.fromJson(jsonDecode(resp.toString()));
    if(responseModel.success) {
      _feedModel.clear();
      _feedModel.addAll(responseModel.feeds);
    } else {
      print('Something went wrong');
    }

    _isLoadingFeed = false;
    notifyListeners();
  }
}
