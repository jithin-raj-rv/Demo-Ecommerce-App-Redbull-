import 'package:flutter/material.dart';
import 'package:redbull/Admin/drinks_editor.dart';


class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Admin Panel')),
        backgroundColor: const Color(0xFF00205B),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to the Admin Panel',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00205B),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your admin functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00205B),
                    ),
                    child: const Text('Manage Users'),
                  ),
                ],
              ),
            ),
            AdminDrinks(onRefresh:() {
               Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (context) => Admin()),
               );
            },)
          ],
        )
      ),
    );
  }
}