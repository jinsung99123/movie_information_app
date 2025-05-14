import 'package:flutter/material.dart';
import 'package:movie_information_app/UI/home/widgets/home_category.dart';


class HomeHighScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeCategory(
      title: '평점 높은순',
      category: 'highScore',
      mapKey: 'topRated',
    );
  }
}
