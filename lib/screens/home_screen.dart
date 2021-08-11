import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/screens/pictures_screen.dart';
import 'package:picture_perfect/screens/videos_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    PicturesScreen(),
    VideosScreen(),
    Center(
      child: Text('Settings'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Picture',
              style: kNormalBoldTextStyle,
            ),
            SizedBox(width: 4),
            Hero(
              tag: 'perf',
              child: Text(
                'Perfect',
                style: kNormalBoldTextStyle.copyWith(
                  color: Color(0xff01c5c4),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.nightlight)),
        ],
        leading: Opacity(
          opacity: 0,
          child: Icon(Icons.nightlight),
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff212120),
        selectedItemColor: Color(0xff01c5c4),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        selectedLabelStyle: kNormalTextStyle,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Pictures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: tabs[_currentIndex],
    );
  }
}
