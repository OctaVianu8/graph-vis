import 'package:flutter/material.dart';

class BFS_Screen extends StatefulWidget {
  const BFS_Screen({Key? key}) : super(key: key);

  @override
  State<BFS_Screen> createState() => _BFS_ScreenState();
}

class _BFS_ScreenState extends State<BFS_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BFS'),
        ),
      ),
    );
  }
}
