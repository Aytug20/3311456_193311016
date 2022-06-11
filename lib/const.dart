import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/views/screens/cart_screen.dart';
import 'package:flutter_eticaret/views/screens/feeds_screen.dart';
import 'package:flutter_eticaret/views/screens/file_screen.dart';
import 'package:flutter_eticaret/views/screens/home_screen.dart';
import 'package:flutter_eticaret/views/screens/profile_screen.dart';
import 'package:flutter_eticaret/views/screens/search_screen.dart';
import 'package:flutter_eticaret/views/screens/upload_screen.dart';

//Sayfalar

List pages = [
  HomeScreen(),
  FeedsScreen(),
  SearchScreen(),
  CartScreen(),
  UploadProductForm(),
  ProfileScreen(),
  FileScreen(),
];

var backgroundColor = Colors.black;

var buttonColor = Colors.black;

var textButtonColor = Colors.white;

//FIREBASE

var firebaseAuth = FirebaseAuth.instance;

var firebaseStore = FirebaseFirestore.instance;

var firebaseStorage = FirebaseStorage.instance;
