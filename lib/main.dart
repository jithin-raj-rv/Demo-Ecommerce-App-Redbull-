
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redbull/Admin/admin.dart';
import 'package:redbull/userAuth/widget_tree.dart';
import 'package:redbull/data/drinks.dart';

// import 'package:redbull/shop.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await fetchDrinksFromFirestore(); // Load drinks before app starts
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WidgetTree(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFC0C0C0),
        appBarTheme: AppBarTheme(
          foregroundColor: Color(0xFFFFD700),
          backgroundColor: Color(0xFF00205B),
          titleTextStyle: TextStyle(
            fontSize: 40,
            color: Color(0xFFDA291C),
            fontWeight: FontWeight.bold
          ))
      ),
    );
  }
}