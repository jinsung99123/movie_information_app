import 'package:flutter/material.dart';

class HomeHighScore extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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