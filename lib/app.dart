import 'package:flutter/material.dart';
import 'package:fluttering/about.dart';
import 'package:fluttering/contact.dart';
//import 'package:fluttering/mypage.dart';
import 'package:fluttering/viewPage.dart';
import 'package:fluttering/viewPage1.dart';
import 'home.dart';
import 'info.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialRoute: '/',
      routes: {
        '/home': (context) => home(),
        '/about': (context) => about(),
        '/contact': (context) =>contact(),
         '/info': (context) =>info(),
        '/viewpage': (context) =>viewPage(),
        '/viewpage1': (context) =>viewPage1(),
      },
      home: home(),
    );
  }
}