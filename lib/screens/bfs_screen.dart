import 'dart:convert';
import 'dart:html';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:graph_vis_test_1/graph/graph.dart';
import 'package:graph_vis_test_1/graph/node.dart';
import 'package:graph_vis_test_1/screens/screen.dart';
import 'package:graphview/GraphView.dart';
import 'package:graph_vis_test_1/util.dart';
import '../graph/node.dart';
import '../widgets/desc_or_pseudo.dart';

class BFSScreen extends StatefulWidget {
  final String title;
  final String source;
  final int begin;
  //final Node begin;
  const BFSScreen({
    Key? key,
    required this.title,
    required this.source,
    required this.begin,
  }) : super(key: key);

  @override
  State<BFSScreen> createState() => _BFSScreenState();
}

class _BFSScreenState extends State<BFSScreen> {
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

    return Screen(
      algo_name: 'bfs',
      title: widget.title,
      source: widget.source,
      begin: widget.begin,
      graphW: GraphW( source: widget.source, visited: node_state, ),
      algoWidget: QueueWidget(),
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

class QueueWidget extends StatefulWidget {
  const QueueWidget({Key? key}) : super(key: key);

  @override
  State<QueueWidget> createState() => _QueueWidgetState();
}

class _QueueWidgetState extends State<QueueWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      color: Colors.blue[200],
      child: SizedBox(
        width: 600,
        child: Scrollbar(
          controller: ScrollController(initialScrollOffset: 0),
          child: ListView.builder(
            controller: ScrollController(initialScrollOffset: 0),
            scrollDirection: Axis.horizontal,
            itemCount: 6, //stack.size
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Text('da'));
            },
          ),
        ),
      ),
    );
  }
}
