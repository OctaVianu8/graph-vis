import 'dart:convert';
import 'dart:html';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graph_vis_test_1/graph/graph.dart';
import 'package:graph_vis_test_1/graph/node.dart';
import 'package:graphview/GraphView.dart';
import 'package:graph_vis_test_1/util.dart';
import '../widgets/desc_or_pseudo.dart';

class DFSScreen extends StatefulWidget {
  final String title;
  final String source;
  final Node begin;
  //final Node begin;
  const DFSScreen({
    Key? key,
    required this.title,
    required this.source,
    required this.begin,
  }) : super(key: key);

  @override
  State<DFSScreen> createState() => _DFSScreenState();
}

class _DFSScreenState extends State<DFSScreen> {
  late Graph graph;
  Map<Node, NodeStates> node_state = Map();
  List<Node> dfstack = [];

  List<String> buttonText = ['Switch to PSEUDOCODE', 'Switch to DESCRIPTION'];
  int tutorialState = 0;

  @override
  Widget build(BuildContext context) {
    dfstack.add(widget.begin);

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
                      visited: node_state,
                      source: widget.source,
                      //graph: loadGraphFromAsset(widget.source),
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
                            onPressed: () {
                              setState(() {
                                node_state[Node.Id(2)] = NodeStates.visited;
                              });
                            },
                            child: Text('Next Step')),
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

  @override
  void initState() {
    loadGraph();
  }

  void loadGraph() async {
    loadGraphFromAsset(widget.source).then((value) => graph = value);
  }

  void advanceDfs() {
    setState(() {
      Node front = dfstack.last;
      for (Node adj in graph.getOutEdges(front).map((e) => e.destination)) {}
    });
  }
}
