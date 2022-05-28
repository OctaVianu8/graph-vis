import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/graph/node.dart';

class StackView extends StatefulWidget {
  final List<int> queue;
  final String? name;
  final NodeStates? state;
  const StackView({Key? key, required this.queue, this.name, this.state})
      : super(key: key);

  @override
  State<StackView> createState() => _QueueWidgetState();
}

class _QueueWidgetState extends State<StackView> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController =
        ScrollController(initialScrollOffset: 0);
    if (scrollController.hasClients) scrollController.jumpTo(0.0);

    return Flexible(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(widget.name ?? 'Queue'),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(16.0),
              color: Colors.blue[200],
              child: Scrollbar(
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.queue.length, //stack.size
                  itemBuilder: (context, index) {
                    //return Container(color: Colors.white, height: 100,);
                    return Container(
                      //padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      //color: Colors.white,
                      margin: EdgeInsets.all(8.0),
                      child: NodeW(
                        id: widget.queue[index],
                        hueShift: index / widget.queue.length,
                        state: widget.state ?? NodeStates.idle,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
