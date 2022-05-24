import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/screens/dfs.dart';
import 'package:graph_vis_test_1/screens/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const DfsScreen(name: "Dfs Ecran lets goo"),
    );
  }
}
