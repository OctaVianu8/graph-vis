import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/screens/dfs_screen.dart';
import 'package:graph_vis_test_1/screens/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GraphAlgoVis',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'GraphAlgoVis'),
      //home: const DfsScreen(name: "Dfs Ecran lets goo"),
    );
  }
}
