import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:weatherui/mainscreen.dart';
import 'package:weatherui/profilepage.dart';
import 'package:weatherui/dayswether.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const DaysWeather(),
    const MainScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xff5842A9),
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xff5842A9),
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          height: 60,
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const <Widget>[
            Icon(Icons.add_chart_rounded, size: 30, color: Colors.black),
            Icon(Icons.home, size: 30, color: Colors.black),
            Icon(Icons.person, size: 30, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
