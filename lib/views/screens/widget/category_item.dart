import 'package:flutter/material.dart';
import 'package:flutter_eticaret/views/screens/feeds_category.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  CategoryItem({Key? key, required this.index}) : super(key: key);
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Forma',
      'categoryImage': 'assets/images/MemphisGrizzlies_FINAL.jpg',
    },
    {
      'categoryName': 'Şapka',
      'categoryImage': 'assets/images/thumb_aspx.jpg',
    },
    {
      'categoryName': 'BasketbolTopu',
      'categoryImage': 'assets/images/top.jpg',
    },
    {
      'categoryName': 'Çorap',
      'categoryImage': 'assets/images/çorap.jpg',
    },
    {
      'categoryName': 'Pantolon',
      'categoryImage': 'assets/images/pantolon.jpg',
    },
    {
      'categoryName': 'Aksesuar',
      'categoryImage': 'assets/images/aksesuar.jpg',
    },
    {
      'categoryName': 'Ceket',
      'categoryImage': 'assets/images/ceket.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, FeedsCategoryScreen.id,
                arguments: '${categories[index]['categoryName']}');
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              image: DecorationImage(
                image: AssetImage(
                  '${categories[index]['categoryImage']}',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          left: 10,
          bottom: 0,
          child: Container(
            child: Text(
              '${categories[index]['categoryName']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
