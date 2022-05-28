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
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          poza_algoritm,
          Text(
              nume_algoritm,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => widget_algoritm));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Learn Algorithm',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
