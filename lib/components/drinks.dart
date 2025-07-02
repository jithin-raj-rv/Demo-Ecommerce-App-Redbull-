import 'package:flutter/material.dart';
import 'package:redbull/data/cart_data.dart';
import 'package:redbull/data/drinks.dart';

class Drinks extends StatefulWidget {
const Drinks({super.key,required this.onRefresh});
final VoidCallback onRefresh;
  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {

void  addOrReplace(indexx){
  int index=CartData.cartItems.indexWhere((item)=>item[0]==drinks.stock[indexx][0]);
  if(index==-1){
    CartData.cartItems.add(drinks.stock[indexx]);
    int updatedIndex=CartData.cartItems.indexWhere((item)=>item[0]==drinks.stock[indexx][0]);
    ++CartData.cartItems[updatedIndex][2];
  }
  else{
    ++CartData.cartItems[index][2];
  }
}

updatecart(index){
  
 addOrReplace(index);
//  ++CartData.cartItems[index][2];
//  print(drinks[index][2]);

}
  removeitem(indexx){
    int index=CartData.cartItems.indexWhere((item)=>item[0]==drinks.stock[indexx][0]);
    index!=-1?CartData.cartItems[index][2]=0:null;
    index!=-1?CartData.cartItems.removeAt(index):null;
  }
  @override
  Widget build(BuildContext context) {
    return         Flexible(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: drinks.stock.length,
            itemBuilder:(context, index) {
             return Padding(
               padding: const EdgeInsets.all(2.0),
               child: Container(
                width: 300,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all()),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Center(child: SizedBox(
                      width: 100,
                      
                      
                         // image
                      child: Column(
                        children: [
                          Image.asset(drinks.stock[index][1],fit: BoxFit.fitWidth,),
                        ],
                      ))),
                 
                          //description  
                     Center(child: Text(drinks.stock[index][3])),
                         // product name
                     Center(child: Text(drinks.stock[index][0],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 65),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                         // Add to cart
                           GestureDetector(
                            onTap: () {
                              setState(() {
                                updatecart(index);
                                
                              });
                              widget.onRefresh();

                            },
                             child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(6)),
                              child: Center(child: Icon(Icons.add_shopping_cart,color: Color(0xFF00205B),))),
                           ),
                             // Remove from cart
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  removeitem(index);
                                });
                                widget.onRefresh();
                                // print(drinks[index][2]);
                                // print(index);
                              },
                              child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(color: Color(0xFFFFD700),borderRadius: BorderRadius.circular(6)),
                              child: Center(child: Icon(Icons.remove_shopping_cart,color: Color(0xFF00205B),))),
                            )
                         ],
                       ),
                     )
                 
                   ],
                 ),
               ),
             );
          },)
        );
  }
}