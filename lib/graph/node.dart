import 'package:flutter/material.dart';

class NodeW extends StatefulWidget {
  final bool visited;
  const NodeW({Key? key, required this.visited}) : super(key: key);

  @override
  State<NodeW> createState() => _NodeWState();
}

class _NodeWState extends State<NodeW> {
  final Color not_visited_c = Colors.blue;
  final Color visited_c = Colors.red;

  @override
  Widget build(BuildContext context) {
    //if (!widget.visited) widget.visited = false;
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: (widget.visited ? visited_c : not_visited_c),
                spreadRadius: 1),
          ],
        ),
        child: Text('Node 1'));
  }
}
