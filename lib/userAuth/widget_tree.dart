
import 'package:redbull/userAuth/Auth.dart';
import 'package:redbull/userAuth/user.dart';
import 'package:redbull/userAuth/loginandregister.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder:(context, snapshot) {
        if (snapshot.hasData){
          return UserProfile();
        }
        else {
          return const Loginandregister();
        }
      },);
  }
}