import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
 const Intro({super.key,required this.onclick});
 final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    final currentWidth=MediaQuery.of(context).size.width;
    double responsive;

    if (currentWidth<=500){
      responsive=125;
    }
    else{
      responsive=200;
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly               ,
            children: [
              SizedBox(
                
                width: responsive,
                child: Image.asset('lib/images/redbull_gives_you_wiiings.png',fit:BoxFit.fitWidth,)),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  """REDBULL""",style: TextStyle(fontWeight: FontWeight.bold,
                                       fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  """GIVES YOU""",style: TextStyle(fontWeight: FontWeight.bold,
                                       fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Text(
                  """WIIINGS""",style: TextStyle(fontWeight: FontWeight.bold,
                                       fontSize: 18),),
              ),
            ],
          ),
    
          //buy button
    
    
          GestureDetector(
            
            onTap: onclick, 
            child: Container(
              
              height: 50,
              width: 400,
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFFFFD700),),
              child: Center(child: Text('BUY NOW!!!',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      );
  }
}