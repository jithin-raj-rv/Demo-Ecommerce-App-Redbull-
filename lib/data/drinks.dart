import 'package:cloud_firestore/cloud_firestore.dart';

//  Future<void> saveDrinksToFirestore() async {
//   final collection = FirebaseFirestore.instance.collection('drinks');
//   for (var drink in drinks.stock) {
//     await collection.add({
//       'name': drink[0],
//       'image': drink[1],
//       'quantity': drink[2],
//       'description': drink[3],
//       'price': drink[4],
//     });
//   }
// }
// Future<List<List<dynamic>>> fetchDrinksFromFirestore() async {
//   final collection = FirebaseFirestore.instance.collection('drinks');
//   final snapshot = await collection.get();
//   List<List<dynamic>> drinksList = [];
//   for (var doc in snapshot.docs) {
//     drinksList.add([
//       doc['name'],
//       doc['image'],
//       doc['quantity'],
//       doc['description'],
//       doc['price'],
//     ]);
//   }
//   return drinksList;
// }
class drinks {
  static List stock = [
    // values are updated here

  ["Classic Redbull",'lib/images/drinks/Blue_redbull.png',0,"The iconic energy boost.",300,],
  ["Black Redbull",'lib/images/drinks/black_redbull.png',0,"Creamy, light, tropical.",100,],
  ["Green Redbull",'lib/images/drinks/green_redbull.png',0,"Crisp, citrusy, refreshing.",120,],
  ["SkyBlue Redbull",'lib/images/drinks/light_blue_redbull.png',0,"Cool, sweet, smooth.",250,],
  ["Purple Redbull",'lib/images/drinks/purple_redbull.png',0,"Exotic, smooth, rich.",125,],
  ["Red Redbull",'lib/images/drinks/red_white_redbull.png',0,"Fruity, refreshing, bold.",115,],
  ["White Redbull",'lib/images/drinks/white_redbull.png',0,"Creamy, light, tropical.",75,],
  ["Yellow Redbull",'lib/images/drinks/yellow_redbull.png',0,"Sunny, citrusy, energetic.",155,],
  ["Orange Redbull",'lib/images/drinks/orange_redbull.png',0,"Zesty, sharp, bold.",135,]
  ];
}