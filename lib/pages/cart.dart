import 'package:flutter/material.dart';
import 'package:redbull/components/buynow.dart';
import 'package:redbull/components/cart_drinks.dart';
import 'package:redbull/data/cart_data.dart';

class Cart extends StatelessWidget {
 const Cart({super.key,required this.buynow,required this.onZero});
  final VoidCallback buynow;
  final VoidCallback onZero;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 15),
          child: Row(
    // Cart Text
            children: [
              Icon(Icons.shopping_bag,color: Color(0xFF00205B),),
              Text("  Cart",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF00205B))),
            ],
          ),
          
        ),
        Divider(
          color: Colors.black,
          height: 10,
          indent: 10,
          endIndent: 10,
        ),
// cart empty validation
        CartData.cartItems.isNotEmpty?
// calling the list of cart items
        CartDrinks(onZero:onZero,)
// 
        :Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Your Cart is Empty",style: TextStyle(fontSize: 20),)),
    // shop button
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: buynow,
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(18)),
                    child: Center(child: Text("SHOP",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),)),),
                ),
              )
            ],
          ),

    // list of cart products
        ),
        CartData.cartItems.isNotEmpty?Buynow(): Container(),
      ],
    );
  }
}