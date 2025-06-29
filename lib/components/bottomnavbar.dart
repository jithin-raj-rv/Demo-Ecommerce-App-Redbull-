import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:redbull/data/cart_data.dart';

class Bottomnavbar extends StatelessWidget {
   final void Function(int)?onTabChange;
   const Bottomnavbar({super.key,required this.onTabChange,required this.numm});
   final int numm;
  @override
  Widget build(BuildContext context) {
    num totalCartItems=0;
    for(int i=1;i<=CartData.cartItems.length;i++){
      totalCartItems+=CartData.cartItems[i-1][2];
    }
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
        selectedIndex: numm,
        tabs: [
      GButton(icon: Icons.home,text: 'Shop',iconSize: 25,),

      GButton(icon: Icons.shopping_cart,text: 'Cart',leading: Stack(
        children: [
          Icon(Icons.shopping_cart,size: 25,),
          // validation
          CartData.cartItems.isNotEmpty? Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(color: Color(0xFFDA291C),borderRadius: BorderRadius.circular(8)),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(totalCartItems.toString(),style: TextStyle(fontWeight: FontWeight.bold,))),
            ),
          ):Container()
        ],
      ))
      ]),
    );
  }
}