import 'package:flutter/material.dart';

class NodeW extends StatefulWidget {
  const NodeW({Key? key}) : super(key: key);

  @override
  State<NodeW> createState() => _NodeWState();
}

class _NodeWState extends State<NodeW> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue, spreadRadius: 1),
            ],
          ),
          child: Text('Node 1')),
    );
  }
}
