import 'dart:convert';
import 'dart:html';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:graph_vis_test_1/graph/graph.dart';
import 'package:graphview/GraphView.dart';
import 'package:graph_vis_test_1/util.dart';
import '../graph/node.dart';
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
  Map<Node, bool> node_state = Map();

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController(initialScrollOffset: 0);
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              color: Colors.white,
              // child: Text('da'),
              child: Column(
                children: [
                  Flexible(
                    child: GraphW(
                      source: widget.source,
                      visited: node_state,
                    ),
                  ),
                  Container(
                    color: Colors.blue[100],
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.all(16.0),
                            color: Colors.blue[200],
                            child: SizedBox(
                              width: 600,
                              child: Scrollbar(
                                controller: scrollController,
                                child: ListView.builder(
                                controller: scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6, //stack.size
                                  itemBuilder: (context, index) {
                                    return Container(padding: EdgeInsets.fromLTRB(8, 8, 0, 8), child: NodeW(visited: true));
                                  },
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Previous Step')),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  node_state[Node.Id(2)] = true;
                                });
                              },
                              child: Text('Next Step')),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              margin: EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
              color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }
}
