import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/graph/graph.dart';
import 'package:graphview/GraphView.dart';

class GraphBuilderScreen extends StatefulWidget {
  const GraphBuilderScreen({Key? key}) : super(key: key);

  @override
  State<GraphBuilderScreen> createState() => _GraphBuilderScreenState();
}

class _GraphBuilderScreenState extends State<GraphBuilderScreen> {
  final Graph graph = Graph();
  String _edgeData = '';

  void updateEdgeData(String edgeData) {
    setState(() {
      List<Edge> edges = graph.edges;
      List<Node> nodes = graph.nodes;
      for (Node n in nodes) {
        graph.removeNode(n);
      }
      for (String line in LineSplitter.split(_edgeData)) {
        var nrs = line.split(' ');
        graph.addEdge(Node.Id(int.parse(nrs[0])), Node.Id(int.parse(nrs[1])));
        graph.addEdge(Node.Id(int.parse(nrs[1])), Node.Id(int.parse(nrs[0])));
      }
      for (Node e in graph.nodes) {
        e.position = e.position +
            Offset(Random().nextDouble() * 10.0, Random().nextDouble() * 10.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> graphAndTextForm = [
      Flexible(
        flex: 4,
        fit: FlexFit.loose,
        child: GraphW(
          stack: [],
          state: {},
          vistack: [],
          graph: graph,
        ),
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the edges',
                ),
                maxLines: null,
                minLines: 1,
                onChanged: (edgeData) {
                  _edgeData = edgeData;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => this.updateEdgeData(_edgeData),
                child: Text('Update Edge Data'))
          ],
        ),
      ),
    ];

    if (width > height) {
      return Row(
        children: graphAndTextForm,
      );
    }
    return Column(
      children: graphAndTextForm,
    );
  }
}
