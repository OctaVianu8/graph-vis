import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/graph/graph.dart';

class DfsScreen extends StatelessWidget {
  final String name;
  const DfsScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
