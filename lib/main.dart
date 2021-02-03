import 'package:flutter/material.dart';
import 'package:slivers_demo/screens/home.dart';
import 'package:slivers_demo/screens/sliver_appbar.dart';
import 'package:slivers_demo/screens/sliver_persistent_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SliverPersistentHeaderScreen(),
    );
  }
}
