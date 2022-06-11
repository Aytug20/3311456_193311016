import 'package:flutter_eticaret/provider/order.dart';
import 'package:flutter_eticaret/provider/products.dart';

import 'package:flutter_eticaret/views/screens/widget/all_products.dart';
import 'package:flutter_eticaret/views/screens/widget/category.dart';
import 'package:flutter_eticaret/views/screens/widget/category_list.dart';
import 'package:flutter_eticaret/views/screens/widget/customApp_bar.dart';
import 'package:flutter_eticaret/views/screens/widget/search_input.dart';
import 'package:flutter_eticaret/views/screens/widget/tagList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();

    final orderProvider = Provider.of<Orders>(context);
    orderProvider.fetchOrders();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SearchInput(),
          TagList(),
          Category(),
          CategoryList(),
          AllProducts(),
        ],
      ),
    ));
  }
}
