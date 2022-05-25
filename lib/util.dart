import 'dart:convert';
import 'package:graphview/GraphView.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Graph> loadGraphFromAsset(String name) async {
  //print('aici\n');
  Graph graph = Graph();
  String data = await rootBundle.loadString(name);
  for (String line in LineSplitter.split(data)) {
    var nrs = line.split(' ');
    //print(nrs[0] + ' ' + nrs[1] + 'aici\n');
    graph.addEdge(Node.Id(int.parse(nrs[0])), Node.Id(int.parse(nrs[1])));
  }
  return graph;
}

Map<String, Graph> preloads = Map();

void addGraph(String name, String file) async {
  loadGraphFromAsset(file).then((value) => preloads[name] = value);
}
