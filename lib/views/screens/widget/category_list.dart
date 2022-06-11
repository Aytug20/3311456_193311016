import 'package:flutter/material.dart';
import 'package:flutter_eticaret/views/screens/feeds_screen.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Yeni ürün',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onHorizontalDragStart: (DragStartDetails details) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FeedsScreen();
                }));
              },
              child: Text(
                'Hepsini Gör',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(
                5,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FeedsScreen();
                  }));
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
