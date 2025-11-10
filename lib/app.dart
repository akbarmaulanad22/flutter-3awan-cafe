import 'package:flutter/material.dart';
import 'package:flutter3awancafe/presentations/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF7F6F2),
        fontFamily: 'Roboto',
      ),
      home: const HomeView(),
    );
  }
}
