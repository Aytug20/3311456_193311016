import 'package:flutter/widgets.dart';

class CartAttribute with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartAttribute(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.imageUrl});
}
