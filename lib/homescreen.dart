import 'package:flutter/material.dart';
import 'package:redbull/components/bottomnavbar.dart';
import 'package:redbull/pages/cart.dart';
import 'package:redbull/pages/intro.dart';
import 'package:redbull/pages/shop.dart';
import 'package:redbull/userAuth/Auth.dart';
import 'package:redbull/userAuth/loginandregister.dart';
import 'package:redbull/userAuth/user.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key,});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  
  int value=0;


   bodypage(){
    if(value==0){
     return Intro(onclick: (){
      setState(() {
        value=1;
      });
     });
    }
    else if(value==1){
    return Shop(onRefresh:() {
      setState(() {
        value=1;
      });
    },);

    }
    else if(value==2){
    return Cart(
      buynow: () {
      setState(() {
        value=1;
      });
    },
    onZero: () {
      setState(() {
        value=2;
      });
    },
    );

    }
    else if(value==3){
      return Loginandregister();
    }

    else if(value==4){
      return UserProfile();
    }
  }

  bottombarpage(index){
    if(index==0){
      setState(() {
        value=1;
      });
    }
    else if(index==1){
      setState(() {
        value=2;
      });
    }
  }

  bottomnavshift(){
    if(value==1){
      return 0;
    }
    else if(value==2){
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        drawer: value !=4? Drawer(
          backgroundColor: Color(0xFF00205B),
      
      // branding
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  children: [
                    SizedBox(
                    
                    height: 125,
                              
                    child: Center(child: Column(
                      children: [
                        Image.asset('lib/images/redbull_logo.png',scale: 4,),
                        // Text('Redbull',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Color(0xFFDA291C)),),
                        Text('REDBULL GIVES YOU WIIINGS!!!',style: TextStyle(color: Color(0xFFC0C0C0)),)
                      ],
                    )),
                  ),
      
                  Divider(
                    height: 0,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                   //page routes
            // SHOP NOW PAGE
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    value=1;
                  });
                },
                child: Container(
                  height: 50,
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
                
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        Icon(Icons.home,color: Color(0xFFC0C0C0),),
                        Text('    SHOP',style: TextStyle(color: Color(0xFFFFD700),fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            // Cart Page
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    value=2;
                  });
                  
                },
                child: Container(
                  height: 50,
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
                
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        Icon(Icons.shopping_cart,color: Color(0xFFC0C0C0),),
                        Text('    Cart',style: TextStyle(color: Color(0xFFFFD700),fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
      
                  ],
                ),
      
            //  My account
               Column(
                 children: [
                   GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        value=4;
                      });
                    },
                    child: Container(
                      height: 50,
                      
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
                    
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          
                          children: [
                            Icon(Icons.account_box,color: Color(0xFFC0C0C0),),
                            Text('    My Account',style: TextStyle(color: Color(0xFFFFD700),fontSize: 20,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                                 ),
                   //  Logout 
                                 GestureDetector(
                    onTap: () {
                       Navigator.of(context).pop();
                      Auth().signOut();
                      setState(() {
                        value=3;
                      });
                    },
                    child: Container(
                      height: 50,
                      
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
                    
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          
                          children: [
                            Icon(Icons.logout,color: Color(0xFFC0C0C0),),
                            Text('    Logout',style: TextStyle(color: Color(0xFFFFD700),fontSize: 20,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                                 ),
                 ],
               ),
              ],
            ),
          )
      
        ):null,
        appBar: AppBar(
          leading: value == 4
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      value = 1; // Go back to Shop or your desired page
                    });
                  },
                )
              : null,
          title: Center(child: Text('Redbull     ')),
        ),
        body:  bodypage(),
      
        bottomNavigationBar: (value==1 || value==2)? Bottomnavbar(onTabChange:(p0) => bottombarpage(p0),numm:bottomnavshift(),):null,
      ),
    );
  }
}