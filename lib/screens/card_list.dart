import 'package:flutter/material.dart';

import '../classes/card_class.dart';
import '../widgets/courses_card.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    AlgoCardList algoCardList = AlgoCardList();
    algoCardList.add_all_cards();

    return ListView(
        children: algoCardList.lista.map((algoList) {
          return CoursesCard(
            nume_algoritm: algoList.algo_name,
            poza_algoritm: algoList.algo_photo,
            widget_algoritm: algoList.algo_screen,
          );
        }).toList(),
      );
  }
}