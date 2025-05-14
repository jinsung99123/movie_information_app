import 'package:flutter/material.dart';
import 'package:movie_information_app/UI/home/widgets/home_category.dart';


class HomeIng extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeCategory(
      title: '상영중',
      category: 'ing',
      mapKey: 'nowPlaying',
    );
  }
}
