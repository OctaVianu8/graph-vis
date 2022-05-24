import 'dart:convert';
import 'dart:html';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graph_vis_test_1/graph/graph.dart';

import '../widgets/desc_or_pseudo.dart';

class DFS_Screen extends StatefulWidget {
  final String title;
  final String? source;
  const DFS_Screen({Key? key, required this.title, this.source})
      : super(key: key);

  @override
  State<DFS_Screen> createState() => _DFS_ScreenState();
}

class _DFS_ScreenState extends State<DFS_Screen> {
  List<String> buttonText = ['Switch to PSEUDOCODE', 'Switch to DESCRIPTION'];
  int tutorialState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(32.0),
              margin: EdgeInsets.all(32.0),
              color: Colors.grey[300],
              // child: Text('da'),
              child: Column(
                children: [
                  Flexible(
                    child: GraphW(
                      source: widget.source,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: Text('Previous Step')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Next Step')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(32.0),
              margin: EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DescOrPseudo(tutorialState: tutorialState),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tutorialState = 1 - tutorialState;
                          });
                        },
                        child: Text(buttonText[tutorialState]),
                      ),
                    ],
                  ),
                ],
              ),
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
