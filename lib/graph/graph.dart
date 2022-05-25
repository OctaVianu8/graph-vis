import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'dart:async';
import 'package:graph_vis_test_1/graph/node.dart';

class GraphW extends StatefulWidget {
  final String? source;
  final Map visited;

  const GraphW({Key? key, this.source, required this.visited})
      : super(key: key);

  @override
  State<GraphW> createState() => _GraphWState();
}

class _GraphWState extends State<GraphW> {
  final attractionRate = 50.0;
  final attractionPrecentage = 100.0;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      constrained: false,
      boundaryMargin: EdgeInsets.all(100),
      minScale: 0.01,
      maxScale: 1.0,
      child: GraphView(
        graph: graph,
        algorithm: FruchtermanReingoldAlgorithm(
          attractionPercentage: attractionPrecentage,
          attractionRate: attractionRate,
        ),
        builder: (Node node) {
          // I can decide what widget should be shown here based on the id
          return NodeW(
            stackPos: 0,
            stackSize: 0,
            passPos: 0,
            id: node.key!.value,
            state: widget.visited[node] != null
                ? widget.visited[node]
                : NodeStates.idle,
          );
        },
      ),
    );
  }

  final Graph graph = Graph()..isTree = false;

  @override
  void initState() {
    // debug visited[Node.Id(2)] = true;
    if (widget.source != null) loadGraphFromAsset(widget.source!);
  }

  void loadGraphFromAsset(String name) async {
    String data = await DefaultAssetBundle.of(context).loadString(name);

    setState(() {
      for (String line in LineSplitter.split(data)) {
        var nrs = line.split(' ');
        //print(nrs[0] + ' ' + nrs[1] + 'aici\n');
        graph.addEdge(Node.Id(int.parse(nrs[0])), Node.Id(int.parse(nrs[1])));
      }
    });
  }
}
