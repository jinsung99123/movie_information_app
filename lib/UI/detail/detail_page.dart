import 'package:flutter/material.dart';
import 'package:movie_information_app/data/model/movie.dart';

class DetailPage extends StatelessWidget{
  final Movie movie;
  const DetailPage({required this.movie});

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