import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
        children: [
          CoursesCard(nume_algoritm: 'nume_algoritm'),
        ],
      ),
    );
  }
}

class CoursesCard extends StatelessWidget {

  CoursesCard({required String this.nume_algoritm, Key? key}) : super(key: key);

  final String nume_algoritm;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nume_algoritm,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image(
              image: NetworkImage(
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif')),
          TextButton(onPressed: () {}, child: const Text('Learn Algorithm')),
        ],
      ),
    );
  }
}
