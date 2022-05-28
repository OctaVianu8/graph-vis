import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/classes/card_class.dart';
import 'package:graph_vis_test_1/screens/card_list.dart';
import 'package:graph_vis_test_1/screens/graph_builder_screen.dart';

import '../widgets/courses_card.dart';
import 'package:graph_vis_test_1/graph/graph.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  List<Widget> ecrane = [
    CardList(),
    GraphBuilderScreen(),
    Text('about us'),
    Text('feedback')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 84, 212, 4),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image.asset('GraphAlgoVis.png'),
            Divider(),
            ListTile(
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
              leading: Icon(Icons.graphic_eq),
              title: Text(
                'Algorithm Tutorials',
                style: textStyle,
              ),
            ),
            ListTile(
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
              leading: Icon(
                Icons.auto_graph,
              ),
              title: Text(
                'Graph Builder',
                style: textStyle,
              ),
            ),
            ListTile(
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
              leading: Icon(Icons.people),
              title: Text(
                'About us',
                style: textStyle,
              ),
            ),
            ListTile(
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
              leading: Icon(Icons.question_mark),
              title: Text(
                'Feedback',
                style: textStyle,
              ),
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: ecrane[_selectedDestination],
    );
  }
}
