import 'package:flutter/material.dart';

class HomeIng extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: Text('현재 상영중')),
        Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 150,
                  color: Colors.red,
                  child: Text('1'),
                ),
                Container(
                  width: 150,
                  color: Colors.amber,
                  child: Text('2')),
                Container(
                  width: 150,
                  color: Colors.green,
                  child: Text('3')),
                Container(
                  width: 150,
                  color: Colors.blue,
                  child: Text('4'))
              ],
            ),
          ),
      ],
    );
  }
}