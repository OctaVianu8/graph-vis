import 'package:flutter/material.dart';

enum NodeStates { stacked, visited, idle }

class NodeW extends StatefulWidget {
  NodeStates state = NodeStates.idle;
  final int passPos;
  final int stackPos;
  final int stackSize;
  final id;
  final Color visitedColorMin = Colors.blue;
  final Color visitedColorMax = Color.fromARGB(255, 35, 0, 131);
  final Color stackedColorMin = Color.fromARGB(255, 197, 13, 0);
  final Color stackedColorMax = Color.fromARGB(255, 255, 153, 0);
  final Color visited_c = Colors.red;
  NodeW(
      {Key? key,
      required this.state,
      required this.stackPos,
      required this.passPos,
      required this.stackSize,
      required this.id})
      : super(key: key);

  @override
  State<NodeW> createState() => _NodeWState();
}

BorderSide getNodeBorderSide() {
  return BorderSide(
    style: BorderStyle.solid,
    width: 2.0,
    color: Colors.black,
  );
}

class _NodeWState extends State<NodeW> {
  @override
  Widget build(BuildContext context) {
    //if (!widget.visited) widget.visited = false;

    Color boxColor;

    switch (widget.state) {
      case NodeStates.idle:
        {
          boxColor = Colors.white;
        }
        break;
      case NodeStates.visited:
        {
          boxColor = widget.visitedColorMin;
        }
        break;
      case NodeStates.stacked:
        {
          boxColor = widget.stackedColorMin;
        }
        break;
      default:
        {
          boxColor = widget.visitedColorMin;
        }
        break;
    }

    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(6),
          border: Border(
            bottom: getNodeBorderSide(),
            top: getNodeBorderSide(),
            left: getNodeBorderSide(),
            right: getNodeBorderSide(),
          ),
          color: boxColor,
          boxShadow: [
            BoxShadow(
                color: Color.lerp(boxColor, Colors.black, 0.2)!.withAlpha(50),
                spreadRadius: 2.0,
                blurRadius: 15.0,
                blurStyle: BlurStyle.normal),
          ],
        ),
        child: Text('Node ${widget.id}'));
  }
}
