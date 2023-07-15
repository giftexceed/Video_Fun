import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const VideoPage(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];
  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            currentIndex: _selectedIndex,
            onTap: onTapNav,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.flame,
                ),
                label: 'Trending',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.music_albums,
                ),
                label: 'Songs',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.settings,
                ),
                label: 'Settings',
              ),
            ]),
      ),
    );
  }
}
