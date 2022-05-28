import 'dart:convert';
import 'dart:html';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
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

class PadScreen extends StatefulWidget {
  final String title;
  final String source;
  final int begin;
  const PadScreen(
      {Key? key,
      required this.title,
      required this.source,
      required this.begin})
      : super(key: key);

  @override
  State<PadScreen> createState() => _PadScreenState();
}

enum PadStates {
  idle,
  findingRoot,
}

class _PadScreenState extends State<PadScreen> {
  final Graph graph = Graph();
  Map<int, NodeStates> node_state = Map();
  List<int> heads = [];
  List<int> visited = [];
  Map<int, int> parent = Map();
  Map<int, int> height = Map();
  List<String> buttonText = ['Switch to PSEUDOCODE', 'Switch to DESCRIPTION'];
  PadStates state = PadStates.idle;

  final TextEditingController a = TextEditingController(),
      b = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController(initialScrollOffset: 0);
    ScrollController _scrollController = ScrollController();

    return Screen(
      algo_name: 'pad',
      title: widget.title,
      source: widget.source,
      begin: widget.begin,
      graphW: GraphW(
        source: widget.source,
        state: node_state,
        stack: visited,
        vistack: heads,
        graph: graph,
        onlyLoadNodes: true,
        whenGraphLoaded: whenGraphLoaded,
      ),
      prev_func: () {},
      next_func: () {},
      algoWidget: Column(
        children: [
          SizedBox(
            width: 500.0,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Flexible(
                child: TextField(
                  controller: a,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Input a node",
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  enabled: state == PadStates.idle,
                ),
              ),
              Flexible(
                child: TextField(
                  controller: b,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Input a node",
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  enabled: state == PadStates.idle,
                ),
              )
            ]),
          ),
          ElevatedButton(
            onPressed: state == PadStates.idle ? addEdge : () {},
            child: Text(state == PadStates.idle
                ? 'Connect sets'
                : 'Connecting sets...'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32.0, 0, 0),
            child: ElevatedButton(
              onPressed: state == PadStates.findingRoot ? findRoot : () {},
              child: Text(state == PadStates.findingRoot
                  ? 'Next Step'
                  : 'Waiting to choose connection...'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    //node_state[widget.begin] = NodeStates.stacked;
  }

  void advancePad() {
    setState(() {
      //print(bfstack);
    });
  }

  void whenGraphLoaded() {
    setState(() {
      for (Node i in graph.nodes) {
        parent[i.key!.value] = i.key!.value;
        node_state[i.key!.value] = NodeStates.visited;
        heads.add(i.key!.value);
        height[i.key!.value] = 1;
      }
      //print(heads);
    });
  }

  void addEdge() {
    setState(() {
      int nodea = int.parse(a.text);
      int nodeb = int.parse(b.text);
      a.text = "";
      b.text = "";
      state = PadStates.findingRoot;
      node_state[nodea] = NodeStates.stacked;
      node_state[nodeb] = NodeStates.stacked;
      visited.add(nodea);
      visited.add(nodeb);
    });
  }

  void findRoot() {
    setState(() {
      print(height);
      int backa = visited[visited.length - 2];
      int backb = visited[visited.length - 1];
      bool ok = true;
      if (parent[backa] != backa) {
        visited.add(parent[backa]!);
        node_state[parent[backa]!] = NodeStates.stacked;
        ok = false;
      } else {
        visited.add(backa);
      }
      if (parent[backb] != backb) {
        visited.add(parent[backb]!);
        node_state[parent[backb]!] = NodeStates.stacked;
        ok = false;
      } else {
        visited.add(backb);
      }
      if (ok) {
        if (graph.getEdgeBetween(Node.Id(backa), Node.Id(backb)) == null) {
          graph.addEdge(Node.Id(backa), Node.Id(backb));
          graph.addEdge(Node.Id(backb), Node.Id(backa));
        } else {
          int back = height[backa]! > height[backb]! ? backa : backb;
          parent[backa] = back;
          parent[backb] = back;
          if (height[backa] == height[backb]) height[back] = height[back]! + 1;
          for (int i in visited) {
            if (i != back) {
              graph.removeEdge(Edge(Node.Id(i), Node.Id(parent[i]!)));
              graph.removeEdge(Edge(Node.Id(parent[i]!), Node.Id(i)));
              parent[i] = parent[back]!;
              node_state[i] = NodeStates.idle;
              graph.addEdgeS(Edge(Node.Id(i), Node.Id(parent[i]!)));
              graph.addEdgeS(Edge(Node.Id(parent[i]!), Node.Id(i)));
            }
          }
          heads.clear();
          visited.clear();
          for (int i in parent.keys) {
            if (i == parent[i]) {
              heads.add(i);
              node_state[i] = NodeStates.visited;
            }
          }
          state = PadStates.idle;
        }
      }
    });
  }
}
