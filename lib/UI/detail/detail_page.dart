import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('이미지'),
          Text('제목/날짜'),
          Text('소제목'),
          Text('키워드'),
          Text('영화 설명')
        ],
      ),
    );
  }
} 