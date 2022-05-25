import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'dart:async';
import 'package:graph_vis_test_1/graph/node.dart';

class GraphW extends StatefulWidget {
  final String? source;
  final Map visited;

  GraphW({Key? key, this.source, required this.visited}) : super(key: key);

  @override
  State<GraphW> createState() => _GraphWState();
}

class _GraphWState extends State<GraphW> {
  final Graph graph = Graph()..isTree = false;
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
          //print(node);
          //print(widget.visited[node]);
          return NodeW(
            stackPos: 0,
            stackSize: 0,
            passPos: 0,
            id: node.key!.value,
            state: widget.visited[node.key!.value] != null
                ? widget.visited[node.key!.value]
                : NodeStates.idle,
            //state: NodeStates.idle,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    if (widget.source != null) loadGraphFromAsset(widget.source!);
    // debug visited[Node.Id(2)] = true
  }

  void loadGraphFromAsset(String name) async {
    //print('aici\n');

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
