import 'package:e_commerce_app/View/login_screen.dart';
import 'package:e_commerce_app/Controller/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => DataProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  ));
}
