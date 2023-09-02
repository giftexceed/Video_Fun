import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    return MaterialApp(
      theme: ThemeData.dark(), // Apply the black theme
      title: 'Video Fun',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
