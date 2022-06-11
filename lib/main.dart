import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eticaret/const.dart';
import 'package:flutter_eticaret/models/clothes.dart';
import 'package:flutter_eticaret/provider/cart_provider.dart';
import 'package:flutter_eticaret/provider/order.dart';
import 'package:flutter_eticaret/provider/products.dart';
import 'package:flutter_eticaret/views/screens/auth/login_screen.dart';
import 'package:flutter_eticaret/views/screens/bottom_navbar.dart';
import 'package:flutter_eticaret/views/screens/detail/detail_page.dart';
import 'package:flutter_eticaret/views/screens/feeds_category.dart';
import 'package:flutter_eticaret/views/screens/file_screen.dart';
import 'package:flutter_eticaret/views/screens/order_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: backgroundColor,
        // ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapShot) {
              if (userSnapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (userSnapShot.connectionState ==
                  ConnectionState.active) {
                if (userSnapShot.hasData) {
                  return BottomNavBar();
                } else {
                  return LoginScreen();
                }
              } else if (userSnapShot.hasError) {
                return Center(
                  child: Text('bir şeyler ters gitti'),
                );
              }
              return Container();
            }),
        routes: {
          DetailPage.id: (context) => DetailPage(),
          FeedsCategoryScreen.id: (context) => FeedsCategoryScreen(),
          OrderScreen.id: (context) => OrderScreen(),
        },
      ),
    );
  }
}
