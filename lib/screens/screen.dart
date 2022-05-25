import 'dart:convert';
import 'dart:html';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:graph_vis_test_1/graph/graph.dart';
import 'package:graph_vis_test_1/graph/node.dart';
import 'package:graphview/GraphView.dart';
import 'package:graph_vis_test_1/util.dart';
import '../graph/node.dart';
import '../widgets/desc_or_pseudo.dart';

class Screen extends StatefulWidget {
  final String title;
  final String source;
  final int begin;
  final GraphW graphW;
  final Widget algoWidget;
  final String algo_name;

  //final Node begin;
  Screen({
    Key? key,
    required this.title,
    required this.source,
    required this.begin,
    required this.graphW,
    required this.algoWidget,
    required this.algo_name,
  }) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late Graph graph;
  Map<Node, NodeStates> node_state = Map();
  List<int> dfstack = [];
  List<String> buttonText = ['Switch to PSEUDOCODE', 'Switch to DESCRIPTION'];
  int tutorialState = 0;

  @override
  Widget build(BuildContext context) {
    dfstack.add(widget.begin);
    final scrollController = ScrollController(initialScrollOffset: 0);
    ScrollController _scrollController = ScrollController();

    //temporar
    //widget.graphW = GraphW( source: widget.source, visited: node_state, );

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
                    child: widget.graphW,
                  ),
                  Container(
                    color: Colors.blue[100],
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          widget.algoWidget,
                          ElevatedButton(
                              onPressed: () {}, child: Text('Previous Step')),
                          ElevatedButton(
                              onPressed: () {},
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
                  DescOrPseudo(tutorialState: tutorialState, algorithm_name: widget.algo_name),
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

  @override
  void initState() {
    loadGraph();
  }

  void loadGraph() async {
    loadGraphFromAsset(widget.source).then((value) => graph = value);
  }

  void advanceDfs() {
    setState(() {
      int front = dfstack.last;
      //for (Node adj in graph.getOutEdges(front).map((e) => e.destination)) {}
    });
  }
}
