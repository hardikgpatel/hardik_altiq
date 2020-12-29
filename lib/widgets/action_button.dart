import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  final Color color;

  const ActionButton({Key key, this.icon, this.title, this.onTap, this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: color.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/$icon.png',
              height: 15,
              width: 15,
              color: color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
