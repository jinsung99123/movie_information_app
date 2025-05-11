import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('가장 인기 있는'),
          Text('현재 상영중'),
          Text('인기순'),
          Text('평점 높은순'),
          Text('개봉예정정')

        ],
      ),
    );
  }
} 