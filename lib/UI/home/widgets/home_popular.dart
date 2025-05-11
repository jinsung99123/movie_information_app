import 'package:flutter/material.dart';

class HomePopular extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4')
          ],
        ),
      );
  }
}