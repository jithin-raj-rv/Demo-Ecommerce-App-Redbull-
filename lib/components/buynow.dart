import 'package:flutter/material.dart';
import 'package:redbull/data/cart_data.dart';
import 'package:redbull/payment/upi.dart';

class Buynow extends StatelessWidget {
  const Buynow({super.key});

  @override
  Widget build(BuildContext context) {
    num totalValue=0;
    for(int i=1;i<=CartData.cartItems.length;i++){
      totalValue+=(CartData.cartItems[i-1][4]*CartData.cartItems[i-1][2]);
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Check Out Now",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),),
            Row(
              children: [
                Text("Total = ",),
                Text("₹$totalValue",style: TextStyle(color: Color(0xFF00205B),),)
              ],
            ),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder:(context) {
                  return Upi(amount: totalValue.toDouble());
                },);
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(10),),
                child: Center(child: Text("Buy ",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}