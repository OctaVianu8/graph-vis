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
  Map<int, NodeStates> node_state = Map();
  List<int> bfstack = [];
  List<String> buttonText = ['Switch to PSEUDOCODE', 'Switch to DESCRIPTION'];
  int tutorialState = 0;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController(initialScrollOffset: 0);
    ScrollController _scrollController = ScrollController();

    return Screen(
      algo_name: 'bfs',
      title: widget.title,
      source: widget.source,
      begin: widget.begin,
      graphW: GraphW(
        source: widget.source,
        state: node_state,
      ),
      algoWidget: QueueWidget(),
      next_func: advanceBfs,
      prev_func: () {},
    );
  }

  @override
  void initState() {
    bfstack.add(widget.begin);
    loadGraph();
  }

  void loadGraph() async {
    loadGraphFromAsset(widget.source).then((value) => graph = value);
  }

  void advanceBfs() {
    setState(() {
      int front = bfstack.first;
      bfstack.removeAt(0);
      node_state[front] = NodeStates.visited;
      for (Node adj
          in graph.getOutEdges(Node.Id(front)).map((e) => e.destination)) {
        if (node_state[adj.key!.value] == null) {
          //print('aici ${adj.key!.value}');
          //print(node_state[adj.key!.value]);
          node_state[adj.key!.value] = NodeStates.stacked;
          bfstack.add(adj.key!.value);
          //print(bfstack);
        }
      }
      //print(bfstack);
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
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 8), child: Text('da'));
            },
          ),
        ),
      ),
    );
  }
}
