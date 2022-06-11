import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/const.dart';
import 'package:flutter_eticaret/views/screens/auth/forgot_password_screen.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  //function to add image to storage

  _uploadImageToStorage(Uint8List? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilFotosu')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('Fotograf secilmedi');
    }
  }

  //function to sign up users

  Future<String> signUpUsers(String full_name, String username, String email,
      String password, Uint8List? image) async {
    String res = 'Hata olustu';
    try {
      if (full_name.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadImageToStorage(image);
        await firebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'username': username,
          'email': email,
          'image': downloadUrl,
        });
        print(cred.user!.email);
        res = 'basarılı';
      } else {
        res = 'Lütfen alanlar boş kalmamalıdır';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //function to login users

  loginUsers(String email, String password) async {
    String res = 'Hata olustu';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'basarılı';
        print('Giris yaptınız');
      } else {
        res = 'Lütfen boş alan bırakmayınız';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  forgotPassword(String email) async {
    String res = 'Hata oluştu';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'basarılı';
        print('e postanıza bir sıfırlama bağlantısı gönderildi');
      } else {
        res = 'E posta alanı boş bırakılmamalıdır';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
