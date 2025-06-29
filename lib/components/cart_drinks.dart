import 'package:flutter/material.dart';
import 'package:redbull/data/cart_data.dart';

class CartDrinks extends StatefulWidget {
  const CartDrinks({super.key,required this.onZero});
  final VoidCallback onZero;
  @override
  State<CartDrinks> createState() => _CartDrinksState();
}

class _CartDrinksState extends State<CartDrinks> {
  removeitem(index){
    CartData.cartItems.removeAt(index);
    widget.onZero();
  }

  @override
  Widget build(BuildContext context)
   {
    final currentWidth=MediaQuery.of(context).size.width;
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: CartData.cartItems.length,
          itemBuilder:(context, index) {
    // validation
          return CartData.cartItems[index][2]!=0? (
            Padding(
            padding: const EdgeInsets.only(right: 20,left: 20,top: 17),
            child: Container(
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 75,
                    child: Image.asset(CartData.cartItems[index][1],fit: BoxFit.fitHeight,)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(CartData.cartItems[index][0],style: TextStyle(fontSize: 20),),
          // mL
                      Row(
                        children: [
                          Text("250 ml"),
                          currentWidth<=500?Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: (
                            Text("₹${CartData.cartItems[0][4].toString()}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                          ):Container(),
                        ],
                      )
                    ],
                  ),
          // price
                  currentWidth>500?(
                  Text('₹${CartData.cartItems[index][4].toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)):Container(),
                  Row(
                    children: [
                  
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                      // + button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  ++CartData.cartItems[index][2];
                                  widget.onZero();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Container(
                                decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(5)),
                                height: 20,
                                width: 20,
                                child: Center(child: Text("+")),
                                ),
                              ),
                            ),
                      // - button 
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (CartData.cartItems[index][2]>=1) {
                                    --CartData.cartItems[index][2];
                                    widget.onZero();
                                  }
                                  if (CartData.cartItems[index][2]==0) {
                                    removeitem(index);
                                    widget.onZero();
                                  }
                                  
                                },
                                );
                              },
                              child: Container(
                              decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(5)),
                                width: 20,
                                height: 20,
                                child: Center(child: Text("-")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(6)),
                          child: Center(child: Text(CartData.cartItems[index][2].toString(),style: TextStyle(color: Color(0xFF00205B),fontSize: 18,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                  // remove from cart
                      GestureDetector(
                                  onTap: () {
                                    CartData.cartItems[index][2]=false;
                                    // print(CartData.cartItems[index][2]);
                                    // print(index);
                                    
                                    setState(() {
                                      removeitem(index);
                                    });
                                  },
                                  child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(6)),
                                  child: Center(child: Icon(Icons.remove_shopping_cart,color: Color(0xFF00205B),))),
                                ),
                    ],
                  )
                ],
              ),
            ),
          )
        ): null;
        },),
      )
    );
  }
}