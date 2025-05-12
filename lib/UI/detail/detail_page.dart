import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/model/home.dart';
import 'package:movie_information_app/data/provider/detail_provider.dart';
import 'package:movie_information_app/data/model/detail.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailViewModelProvider(movie.id));

    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지')),
      body: ListView(
        children: [
          Container(height: 500,
          child: Image.network('http://tmdb.org/t/p/w500${movie.posterPath}'),),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'moana 2',
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
