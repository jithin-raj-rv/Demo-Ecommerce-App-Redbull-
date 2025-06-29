import 'package:flutter/material.dart';
import 'package:redbull/Homescreen.dart';
import 'package:redbull/userAuth/Auth.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Homescreen();
  }
}



// for reference

// Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _userUid(),
//             SizedBox(height: 20),
//             _signOutButton(),
//           ],
//         ),
//       ),
//     );