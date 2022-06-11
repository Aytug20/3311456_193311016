import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  final tagList = [
    'Şapka',
    'Forma',
    'Üst Giyim',
  ];
  TagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tagList
          .map(
            (e) => Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                e,
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
          .toList(),
    );
  }
}
