import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/graph/graph.dart';

class DFS_Screen extends StatelessWidget {
  final String title;
  DFS_Screen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: GraphW()),
        ],
      ),
    );
  }
}
