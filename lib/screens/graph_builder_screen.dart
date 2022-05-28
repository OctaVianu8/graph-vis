import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/graph/graph.dart';

class GraphBuilderScreen extends StatefulWidget {
  const GraphBuilderScreen({Key? key}) : super(key: key);

  @override
  State<GraphBuilderScreen> createState() => _GraphBuilderScreenState();
}

class _GraphBuilderScreenState extends State<GraphBuilderScreen> {
  String _edgeData = '';

  void updateEdgeData(String edgeData) {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> graphAndTextForm = [
      Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: GraphW(
          stack: [],
          state: {},
          vistack: [],
        ),
      ),
      Flexible(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the edges',
                ),
                maxLines: null,
                minLines: 5,
                onChanged: (edgeData) {
                  _edgeData = edgeData;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => this.updateEdgeData(_edgeData),
                child: Text('Update Edge Data'))
          ],
        ),
      ),
    ];

    if (width > height) {
      return Row(
        children: graphAndTextForm,
      );
    }
    return Column(
      children: graphAndTextForm,
    );
  }
}

class CreatedGraphWidget extends StatefulWidget {
  const CreatedGraphWidget({Key? key}) : super(key: key);

  @override
  State<CreatedGraphWidget> createState() => CreatedGraphWidgetState();
}

class CreatedGraphWidgetState extends State<CreatedGraphWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
