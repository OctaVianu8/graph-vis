import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/classes/card_class.dart';

import '../widgets/courses_card.dart';
import 'package:graph_vis_test_1/graph/graph.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AlgoCardList algoCardList = AlgoCardList();
    algoCardList.add_all_cards();

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Menu',
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: algoCardList.lista.map((algoList) {
          return CoursesCard(
            nume_algoritm: algoList.algo_name,
            poza_algoritm: algoList.algo_photo,
            widget_algoritm: algoList.algo_screen,
          );
        }).toList(),
      ),
    );
  }
}