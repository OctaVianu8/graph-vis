import 'dart:convert';
import 'package:graphview/GraphView.dart';
import 'package:flutter/services.dart' show rootBundle;

Graph mainGraph = Graph();

void changeMainGraph(Graph other) {
  mainGraph = other;
}

Future<Graph> loadGraphFromAsset(String name) async {
  //print('aici\n');
  Graph graph = Graph();
  String data = await rootBundle.loadString(name);
  for (String line in LineSplitter.split(data)) {
    var nrs = line.split(' ');
    //print(nrs[0] + ' ' + nrs[1] + 'aici\n');
    graph.addEdge(Node.Id(int.parse(nrs[0])), Node.Id(int.parse(nrs[1])));
    graph.addEdge(Node.Id(int.parse(nrs[1])), Node.Id(int.parse(nrs[0])));
  }
  return graph;
}
