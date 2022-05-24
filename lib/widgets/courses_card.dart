import 'package:flutter/material.dart';

class CoursesCard extends StatelessWidget {
  CoursesCard(
      {required String this.nume_algoritm,
      required Image this.poza_algoritm,
      required Widget this.widget_algoritm,
      Key? key})
      : super(key: key);

  String nume_algoritm;
  Image poza_algoritm;
  Widget widget_algoritm;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
          poza_algoritm,
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => widget_algoritm));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Learn Algorithm',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
