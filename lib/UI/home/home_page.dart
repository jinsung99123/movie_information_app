import 'package:flutter/material.dart';
import 'package:movie_information_app/UI/home/widgets/home_high_score.dart';
import 'package:movie_information_app/UI/home/widgets/home_ing.dart';
import 'package:movie_information_app/UI/home/widgets/home_most_popular.dart';
import 'package:movie_information_app/UI/home/widgets/home_popular.dart';
import 'package:movie_information_app/UI/home/widgets/home_scheduled.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            HomeMostPopular(),
            HomeIng(),
            HomePopular(),
            HomeHighScore(),
            HomeScheduled()
          ],
        ),
      ),
    );
  }
} 