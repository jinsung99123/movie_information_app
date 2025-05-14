import 'package:flutter/material.dart';

import 'package:movie_information_app/UI/home/widgets/home_category.dart';


class HomeScheduled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeCategory(
      title: '인기순',
      category: 'upcoming',
      mapKey: 'upcoming',
    );
  }
}
