import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'dart:async';
import 'package:graph_vis_test_1/graph/node.dart';

class GraphW extends StatefulWidget {
  final bool? onlyLoadNodes;
  final String? source;
  final Map state;
  final List<int> vistack;
  final List<int> stack;
  final Function? whenGraphLoaded;
  final Graph graph;
  GraphW(
      {Key? key,
      required this.graph,
      this.source,
      required this.state,
      required this.vistack,
      required this.stack,
      this.whenGraphLoaded,
      this.onlyLoadNodes})
      : super(key: key);

  @override
  State<GraphW> createState() => _GraphWState();
}

class _GraphWState extends State<GraphW> {
  //final Graph graph = Graph()..isTree = false;
  final attractionRate = 50.0;
  final attractionPrecentage = 100.0;

  @override
  Widget build(BuildContext context) {
    Map stackMap = Map();

    for (int i = 0; i < widget.stack.length; i++) {
      stackMap[widget.stack[i]] = i / widget.stack.length;
    }
    for (int i = 0; i < widget.vistack.length; i++) {
      stackMap[widget.vistack[i]] = i / widget.vistack.length;
    }
    return InteractiveViewer(
      constrained: false,
      boundaryMargin: EdgeInsets.all(100),
      minScale: 0.01,
      maxScale: 1.0,
      child: GraphView(
        graph: widget.graph,
        algorithm: FruchtermanReingoldAlgorithm(
          attractionPercentage: attractionPrecentage,
          attractionRate: attractionRate,
        ),
        builder: (Node node) {
          // I can decide what widget should be shown here based on the id
          //print(node);
          //print(widget.visited[node]);
          return NodeW(
            hueShift: stackMap[node.key!.value],
            id: node.key!.value,
            state: widget.state[node.key!.value] ?? NodeStates.idle,
            //state: NodeStates.idle,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    if (widget.source != null)
      loadGraphFromAsset(widget.source!,
          onlyLoadNodes: widget.onlyLoadNodes ?? false);
    // debug visited[Node.Id(2)] = true
  }

  void loadGraphFromAsset(String name, {bool onlyLoadNodes = false}) async {
    print('aici\n');

    String data = await DefaultAssetBundle.of(context).loadString(name);

    setState(() {
      for (String line in LineSplitter.split(data)) {
        var nrs = line.split(' ');
        //print(nrs[0] + ' ' + nrs[1] + 'aici\n');
        if (onlyLoadNodes) {
          if (!widget.graph.contains(node: Node.Id(int.parse(nrs[0]))))
            widget.graph.addNode(Node.Id(int.parse(nrs[0])));
          if (!widget.graph.contains(node: Node.Id(int.parse(nrs[1]))))
            widget.graph.addNode(Node.Id(int.parse(nrs[1])));
        } else {
          widget.graph
              .addEdge(Node.Id(int.parse(nrs[0])), Node.Id(int.parse(nrs[1])));
          widget.graph
              .addEdge(Node.Id(int.parse(nrs[1])), Node.Id(int.parse(nrs[0])));
        }
      }
      //evil position hack
      for (Node e in widget.graph.nodes) {
        e.position = Offset(Random().nextDouble() * 10.0 + 250.0,
            Random().nextDouble() * 10.0 + 250.0);
      }
      if (widget.whenGraphLoaded != null) widget.whenGraphLoaded!();
    });
  }
}
