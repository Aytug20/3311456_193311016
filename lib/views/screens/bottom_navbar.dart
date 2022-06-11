import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/const.dart';
import 'package:provider/provider.dart';

import '../../provider/products.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          activeColor: textButtonColor,
          inactiveColor: Colors.white,
          backgroundColor: backgroundColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: backgroundColor,
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.rss_feed,
                  size: 30,
                ),
                label: 'Ekle'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: 'Ara'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  size: 30,
                ),
                label: 'Sepet'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.upload,
                  size: 30,
                ),
                label: 'Yükleme'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: 'Kişi'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_download,
                  size: 30,
                ),
                label: 'Belge'),
          ]),
      body: pages[pageIndex],
    );
  }
}
