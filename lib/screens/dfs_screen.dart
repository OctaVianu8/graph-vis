import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/graph/graph.dart';

class DFS_Screen extends StatelessWidget {
  final String title;
  final String? source;
  const DFS_Screen({Key? key, required this.title, this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GraphW(
            source: source,
          )),
        ],
      ),
    );
  }
}
