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
    return Text("Email: ${user?.email ?? 'User email'}");
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFD700), // Gold color
        foregroundColor: Color(0xFF00205B), // Dark blue color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return 
    
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userUid(),
            SizedBox(height: 20),
            _signOutButton(),
          ],
        ),
       );
    
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