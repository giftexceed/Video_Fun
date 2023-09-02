import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_fun/texts.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
     Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const HomePage()),
);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Video Fun', style: playlistStyle)],
        ),
      ),
    );
  }
}
