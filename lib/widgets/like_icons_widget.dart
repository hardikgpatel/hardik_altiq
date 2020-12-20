import 'package:flutter/material.dart';

class LikeIconsWidget extends StatelessWidget {
  final List<String> icons;

  const LikeIconsWidget({Key key, this.icons}) : super(key: key);

  _buildIcons() {
    List<Widget> _icons = [];
    double _space = 0.0;
    for (int i = 0; i < icons.length; i++) {
      _icons.add(
        Container(
          margin: EdgeInsets.only(left: _space),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Image.asset(
            'assets/icons/${icons[i]}.png',
            height: 20,
            width: 20,
          ),
        ),
      );
      _space += 15.0;
    }
    return _icons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: _buildIcons(),
      ),
    );
  }
}
