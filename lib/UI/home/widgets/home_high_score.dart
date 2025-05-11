import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/provider/movie_provider.dart';

class HomeHighScore extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviestate = ref.watch(movieViewModelProvider);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: Text('평점 높은순')),
        Container(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
                return Text('data');
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              itemCount: 5,
            ),
          ),
      ],
    );
  }
}