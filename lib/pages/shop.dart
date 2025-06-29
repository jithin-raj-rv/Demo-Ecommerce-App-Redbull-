import 'package:flutter/material.dart';
import 'package:redbull/components/drinks.dart';

class Shop extends StatefulWidget {
  const Shop({super.key,required this.onRefresh,});
  final VoidCallback onRefresh;

  @override
  State<Shop> createState() => _ShopState();
}


class _ShopState extends State<Shop> {
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
// search bar

        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 35,left: 35,right: 35,bottom: 8),
            child: Container(
              height: 50,
              width: 800,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Color(0xFF00205B),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: controller,
                        style: TextStyle(color: Color(0xFFFFD700)),
                        decoration: InputDecoration(
            
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Color(0xFFFFD700)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(Icons.search, color: Color(0xFFFFD700)),
                  ),
                ],
              )
            ),
          ),
        ),

// message 
        Text('"Born to perform, built to fly."',style: TextStyle(fontSize: 15),),
        Divider(
          height: 10,
          color: Colors.black,
          indent: 10,
          endIndent: 10,
        ),

// hot picks
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("⚡Top Picks⚡",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        ),

        Drinks(onRefresh:widget.onRefresh,),
      ],

    );
  }
}
