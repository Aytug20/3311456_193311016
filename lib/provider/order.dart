import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/const.dart';
import 'package:flutter_eticaret/models/order_attribute.dart';

class Orders with ChangeNotifier {
  List<OrderAttribute> _orders = [];
  List<OrderAttribute> get getOrders {
    return _orders;
  }

  Future<void> fetchOrders() async {
    await firebaseStore
        .collection('orders')
        .where('userId', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((QuerySnapshot productSnapshot) {
      _orders.clear();
      productSnapshot.docs.forEach((element) {
        _orders.insert(
            0,
            OrderAttribute(
                orderId: element.get('orderId'),
                userId: element.get('userId'),
                title: element.get('title'),
                price: element.get('price').toString(),
                imageUrl: element.get('imageUrl'),
                quantity: element.get('quantity').toString(),
                orderDate: element.get('orderDate')));
      });
    });
    notifyListeners();
  }
}
