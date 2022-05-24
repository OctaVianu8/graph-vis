import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/graph/graph.dart';
import 'package:graphview/GraphView.dart';
import 'package:graph_vis_test_1/util.dart';

class DFSScreen extends StatefulWidget {
  final String title;
  final String source;
  const DFSScreen({Key? key, required this.title, required this.source})
      : super(key: key);

  @override
  State<DFSScreen> createState() => _DFSScreenState();
}

class _DFSScreenState extends State<DFSScreen> {
  Map<Node, bool> node_state = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500.0,
            width: 500.0,
            child: GraphW(
              visited: node_state,
              source: widget.source,
              //graph: loadGraphFromAsset(widget.source),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  node_state[Node.Id(2)] = true;
                });
              },
              child: Text('da da da')),
        ],
      ),
    );
  }
}
