import 'package:flutter/material.dart';
import 'package:redbull/data/cart_data.dart';
import 'package:redbull/data/drinks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class AdminDrinks extends StatefulWidget {
const AdminDrinks({super.key,required this.onRefresh});
final VoidCallback onRefresh;
  @override
  State<AdminDrinks> createState() => _DrinksState();
}

class _DrinksState extends State<AdminDrinks> {

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
    CartData.cartItems.isNotEmpty?CartData.cartItems[index][2]=0:null;
    CartData.cartItems.isNotEmpty?CartData.cartItems.removeAt(index):null;
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
                     Center(child: GestureDetector(
                      onTap: () async {
        //  image editor
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 172, ratioY: 461), // Change to your required ratio
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          drinks.stock[index][1] = croppedFile.path;
        });
        widget.onRefresh();
      }
    }
  },
                       child: SizedBox(
                        width: 100,
                        
                        
                           // image
                        child: drinks.stock[index][1].startsWith('/')
                          ? Image.file(File(drinks.stock[index][1]), fit: BoxFit.fitWidth)
                          : Image.asset(drinks.stock[index][1], fit: BoxFit.fitWidth)
                        
                        ),
                     )),
                 
                          //description  
                     Center(child: GestureDetector(
                      onTap: () {
                        showDialog(
              // edit description dialog
  context: context,
  builder: (context) {
    TextEditingController controller = TextEditingController(text: drinks.stock[index][3]);
    return AlertDialog(
      title: Text('Edit description'),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              drinks.stock[index][3] = controller.text;
            });
            widget.onRefresh();
            Navigator.pop(context);
            widget.onRefresh();
          },
          child: Text('Save'),
        ),
      ],
    );
  },
);
                      },
                      child: Text(drinks.stock[index][3]))),
                         // product name
                     Center(child: 
                     
                     GestureDetector(
                      onTap: () {

          // dialog to edit the title
                        showDialog(
  context: context,
  builder: (context) {
    TextEditingController controller = TextEditingController(text: drinks.stock[index][0]);
    return AlertDialog(
      title: Text('Edit Title'),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              drinks.stock[index][0] = controller.text;
            });
            Navigator.pop(context);
            widget.onRefresh();
          },
          child: Text('Save'),
        ),
      ],
    );
  },
);

// saveDrinksToFirestore();
                      },
                      child: Text(drinks.stock[index][0],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),))),
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