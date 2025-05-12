import 'package:flutter/material.dart';
import 'package:movie_information_app/data/model/movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  const DetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지')),
      body: ListView(
        children: [
          Container(height: 500, color: Colors.blue),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Moana2',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('2024-11-27'),
                  ],
                ),
                Text('the ocean is calling them back'),
                Text('100분'),
                Text('태그 태그 태그 태그'),
                Text('영화 설명'),
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text('평점'),
                      Text('평점투표수'),
                      Text('인기점수'),
                      Text('예산'),
                      Text('수익')
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text('제작사1'),
                      Text('제작사2'),
                      Text('제작사3')
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
