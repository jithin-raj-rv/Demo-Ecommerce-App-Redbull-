import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Loginregisterbutton extends StatelessWidget {
  const Loginregisterbutton({super.key,required this.onTabChange});
  final Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        color: Color(0xFF00205B),
        activeColor: Color(0xFF00205B),
        tabBackgroundColor: Color(0xFFFFD700),
        rippleColor: Color(0xFF00205B),
        tabBorderRadius: 15,
        onTabChange: (value) => onTabChange!(value),
        // selectedIndex: numm,
        tabs: [
      GButton(icon: Icons.home,text: ' instead',iconSize: 25,leading: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF00205B)),),),

      GButton(icon: Icons.shopping_cart,text: ' instead',iconSize: 25,leading: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF00205B)),),)
      ]),
    );
  }
}