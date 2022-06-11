import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_eticaret/const.dart';
import 'package:uuid/uuid.dart';

class UploadProductController {
  _uploadImageToStorage(File? imageUrl) async {
    Reference ref = firebaseStorage
        .ref()
        .child('ürünler')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(imageUrl!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  var uuid = Uuid();
  Future<String> uploadProducts(
      String title,
      String id,
      var price,
      String productCategoryname,
      String description,
      var quantity,
      File? imageUrl) async {
    String res = 'Sorun olustu';

    try {
      final productId = uuid.v4();
      if (title.isNotEmpty &&
          price.isNotEmpty &&
          productCategoryname.isNotEmpty &&
          description.isNotEmpty &&
          quantity.isNotEmpty &&
          imageUrl != null) {
        String downloadUrl = await _uploadImageToStorage(imageUrl);
        await firebaseStore.collection('products').doc(productId).set({
          'title': title,
          'id': id,
          'price': price,
          'productCategoryname': productCategoryname,
          'description': description,
          'quantity': quantity,
          'imageUrl': downloadUrl,
        });
      }
    } catch (e) {}
    return res;
  }
}
