import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hardik_atliq/models/feed_response_model.dart';
import 'package:hardik_atliq/widgets/action_button.dart';
import 'package:hardik_atliq/widgets/like_icons_widget.dart';

class FeedWidget extends StatelessWidget {
  final FeedModel feed;

  const FeedWidget({Key key, this.feed}) : super(key: key);

  Widget _threeItemPopup(context) => PopupMenuButton(
        onSelected: (value) {},
        itemBuilder: (context) {
          var list = List<PopupMenuEntry<Object>>();
          list.add(
            PopupMenuItem(
              child: Text(
                'Report',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff2E3131),
                ),
              ),
              value: 'report',
            ),
          );
          return list;
        },
        child: Container(
          height: 40.0,
          width: 40.0,
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png',
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
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feed.username,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      feed.time,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              _threeItemPopup(context)
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 40),
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            height: 170,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: feed.url,
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    LikeIconsWidget(icons: ['thumbs_up','hart','wow'],),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${feed.likes}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${feed.comments} Comment',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                if (feed.description != null && feed.description.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ActionButton(
                      title: 'LIKE',
                      icon: 'ic_like',
                      onTap: () {

                      },
                    ),
                    ActionButton(
                      title: 'COMMENT',
                      icon: 'ic_message',
                    ),
                    ActionButton(
                      title: 'SHARE',
                      icon: 'ic_share',
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
