import 'package:flutter/material.dart';
import 'package:graph_vis_test_1/algorithm%20screens/bfs_screen.dart';

class _Card
{
    String algo_name;
    Image algo_photo;
    Widget algo_screen;
    _Card({required String this.algo_name, required Image this.algo_photo, required Widget this.algo_screen});
}

class AlgoCardList
{
  List<_Card> lista=[]; 
  void add_all_cards()
  {
    add_bfs_card();
    add_dfs_card();
  }

  void add_bfs_card()
  { 
    String _name='Breadth-first search (BFS)';
    Image _photo=(Image.asset('BFS_cover.png') );
    Widget _screen = BFS_Screen();
    _Card _card = _Card(algo_name: _name, algo_photo: _photo, algo_screen: _screen);
    lista.add(_card);
  }

  void add_dfs_card()
  {
    String _name='Depth-first search (DFS)';
    Image _photo=(Image.asset('DFS_cover.png') );
    Widget _screen = BFS_Screen();
    _Card _card = _Card(algo_name: _name, algo_photo: _photo, algo_screen: _screen);
    lista.add(_card);
  }
  //map(Map Function(dynamic context) param0) {}
}