import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/products.dart';

class DetailPage extends StatelessWidget {
  static const String id = 'detailPage';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final _cartProvider = Provider.of<CartProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productAttr = productData.findById(productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${productAttr.imageUrl}'),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 35,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          0.9,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${productAttr.title}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FavoriteButton(
                    valueChanged: (_isFavorite) {
                      print('Is Favorite $_isFavorite)');
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Text(
                '${productAttr.description}',
                style: TextStyle(
                  height: 1.7,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Fiyat',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${productAttr.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            primary: Colors.black,
                          ),
                          onPressed:
                              _cartProvider.getCartItem.containsKey(productId)
                                  ? null
                                  : () {
                                      _cartProvider.addProductToCart(
                                          productId,
                                          productAttr.price,
                                          productAttr.title,
                                          productAttr.imageUrl);
                                    },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _cartProvider.getCartItem.containsKey(productId)
                                    ? 'Sepete eklendi'
                                    : 'Sepete ekle',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.shopping_cart_outlined,
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
