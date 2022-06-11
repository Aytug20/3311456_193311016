import 'package:flutter_eticaret/provider/products.dart';
import 'package:flutter_eticaret/views/screens/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/products.dart';

class FeedsCategoryScreen extends StatelessWidget {
  static const String id = 'feedsCategoryScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    final categoryName = ModalRoute.of(context)!.settings.arguments as String;

    final productList = productsProvider.findByCategory(categoryName);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Ürün Seç',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          childAspectRatio: 240 / 320,
          mainAxisSpacing: 8,
          children: List.generate(
            productList.length,
            (index) => ChangeNotifierProvider.value(
                value: productList[index], child: FeedsProducts()),
          ),
        ));
  }
}
