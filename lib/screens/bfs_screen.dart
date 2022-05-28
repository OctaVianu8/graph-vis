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
import 'package:graph_vis_test_1/widgets/stack_view.dart';

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
  final Graph graph = Graph();
  Map<int, NodeStates> node_state = Map();
  List<int> bfstack = [];
  List<int> vistack = [];
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
        stack: bfstack,
        vistack: vistack,
        graph: graph,
        onlyLoadNodes: false,
      ),
      algoWidget: Column(
        children: [
          StackView(queue: bfstack, name: 'Queue', state: NodeStates.stacked),
          StackView(queue: vistack, name: 'Output', state: NodeStates.visited),
        ],
      ),
      next_func: advanceBfs,
      prev_func: () {},
    );
  }

  @override
  void initState() {
    bfstack.add(widget.begin);
    node_state[widget.begin] = NodeStates.stacked;
  }

  void advanceBfs() {
    if (bfstack.isEmpty) return;
    setState(() {
      int front = bfstack.first;
      bfstack.removeAt(0);
      node_state[front] = NodeStates.visited;
      vistack.add(front);
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
