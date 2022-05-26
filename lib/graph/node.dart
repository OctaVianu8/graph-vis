import 'package:flutter/material.dart';
import 'dart:math';

enum NodeStates { stacked, visited, idle }

class NodeW extends StatefulWidget {
  final NodeStates? state;
  final double? hueShift;
  final id;
  final Color visitedColorMin = Colors.blue;
  final Color visitedColorMax = Color.fromARGB(255, 35, 0, 131);
  final Color stackedColorMin = Color.fromARGB(255, 197, 13, 0);
  final Color stackedColorMax = Color.fromARGB(255, 255, 153, 0);
  final Color visited_c = Colors.red;
  NodeW(
      {Key? key,
      required this.state,
      required this.hueShift,
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
          boxColor = HSLColor.lerp(HSLColor.fromColor(widget.visitedColorMin),
                                    HSLColor.fromColor(widget.visitedColorMax),
                                    widget.hueShift ?? 0)!.toColor();
        }
        break;
      case NodeStates.stacked:
        {
          boxColor = HSLColor.lerp(HSLColor.fromColor(widget.stackedColorMin),
                                    HSLColor.fromColor(widget.stackedColorMax),
                                    widget.hueShift ?? 0)!.toColor();
        }
        break;
      default:
        {
          boxColor = widget.visitedColorMin;
        }
        break;
    }

    return Container(
        //constraints: BoxConstraints(),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
