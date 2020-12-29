import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hardik_atliq/models/story_response_model.dart';
import 'package:hardik_atliq/provider/feed_provider.dart';
import 'package:provider/provider.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;

  StoryWidget({this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<FeedProvider>(context, listen: false)
                .updateStorySeen(story);
          },
          child: Container(
            margin: EdgeInsets.only(
              left: 5,
            ),
            padding: EdgeInsets.all(2),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: story.isSeen ? Colors.grey : Colors.blue,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: story.profile,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          story.name ?? '',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
