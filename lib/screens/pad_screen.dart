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

class PadScreen extends StatefulWidget {
  final String title;
  final String source;
  final int begin;
  //final Node begin;
  const PadScreen({
    Key? key,
    required this.title,
    required this.source,
    required this.begin,
  }) : super(key: key);

  @override
  State<PadScreen> createState() => _PadScreenState();
}

class _PadScreenState extends State<PadScreen> {
  final Graph graph=Graph();
  Map<int, NodeStates> node_state = Map();
  List<int> vistack= [];
  List<String> buttonText = ['Switch to PSEUDOCODE', 'Switch to DESCRIPTION'];
  int tutorialState = 0;

  final TextField a=TextField(
    decoration: InputDecoration(
      fillColor: Colors.white,
      labelText: "Input a node",),
    inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly],
    
  );
  final TextField b=TextField(
    decoration: InputDecoration(
      fillColor: Colors.white,
      labelText: "Input a node",),
    inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly],
    
  );

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController(initialScrollOffset: 0);
    ScrollController _scrollController = ScrollController();

    return Screen(
      algo_name: 'Pad',
      title: widget.title,
      source: widget.source,
      begin: widget.begin,
      graphW: GraphW(
        source: widget.source,
        state: node_state,
        stack: vistack,
        vistack: vistack,
        graph: graph,
        onlyLoadNodes: true,
      ),
      algoWidget: Column(
        children: [
          SizedBox(
            width: 500.0,
            child: Row(
              mainAxisSize:MainAxisSize.min,
              children: [
              Flexible(child: a),
              Flexible(child: b)
            ],),
          ),
          Flexible(
            flex:1,
            child: TextButton(
              autofocus: false,
              clipBehavior: Clip.none,
              onPressed: (){}, 
              child: Text('APAMASA')),
          ),
        ],
      ),
      next_func: advancePad,
      prev_func: () {},
    );
  }

  @override
  void initState() {
    node_state[widget.begin]=NodeStates.stacked;
  }

  void advancePad() { 
    setState(() {
      //print(bfstack);
    });
  }

  void addEdge(){
    setState(() {
      
    });
  }
}
