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

class DFSScreen extends StatefulWidget {
  final String title;
  final String source;
  final int begin;
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
  Map<int, NodeStates> node_state = Map();
  List<int> dfstack = [];
  List<String> buttonText = ['Switch to PSEUDOCODE', 'Switch to DESCRIPTION'];
  int tutorialState = 0;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController(initialScrollOffset: 0);
    ScrollController _scrollController = ScrollController();
    return Screen(
      algo_name: 'dfs',
      title: widget.title,
      source: widget.source,
      begin: widget.begin,
      graphW: GraphW( source: widget.source, visited: node_state, ),
      algoWidget: StackWidget(),
    );
  }

  @override
  void initState() {
    dfstack.add(widget.begin);
    node_state[dfstack.last] = NodeStates.stacked;
    initGraph();
  }

  void initGraph() async {
    loadGraphFromAsset(widget.source).then((value) {
      graph = value;
      print(graph.edges);
    });
  }

  void advanceDfs() {
    setState(() {
      int front = dfstack.last;

      dfstack.removeLast();
      for (Node adj
          in graph.getOutEdges(Node.Id(front)).map((e) => e.destination)) {
        if (node_state[adj.key!.value] == null) {
          node_state[adj.key!.value] = NodeStates.stacked;
          dfstack.add(adj.key!.value);
        }
      }
      node_state[front] = NodeStates.visited;

      print(node_state);
    });
  }
}

class StackWidget extends StatefulWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
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
