import 'package:flutter/material.dart';
import 'package:hardik_atliq/screens/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Image.asset(
            'assets/icons/camera.png',
            height: 20,
            width: 20,
          ),
        ),
        title: Text(
          'Facebook',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Image.asset(
              'assets/icons/messenger.png',
              height: 20,
              width: 20,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: FeedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined),
            title: Container(height: 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            title: Container(height: 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Container(height: 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Container(height: 0),
          ),
        ],
        showSelectedLabels: false,
        currentIndex: _selectedTabIndex,
        onTap: (index) => setState(() => _selectedTabIndex = index),
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }
}
