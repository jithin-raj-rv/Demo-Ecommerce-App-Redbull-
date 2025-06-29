import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redbull/components/loginRegisterButton.dart';
import '../userAuth/Auth.dart';

class Loginandregister extends StatefulWidget {
  const Loginandregister({super.key});

  @override
  State<Loginandregister> createState() => _LoginandregisterState();
}

class _LoginandregisterState extends State<Loginandregister> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPasswoed(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFFFFD700)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            controller: controller,
            obscureText: title.toLowerCase() == "password",
            decoration: InputDecoration(
              labelText: title,
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return errorMessage!=''? Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Center(
              child: Text(
                errorMessage == '' ? '' : 'Hmm? $errorMessage',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
          errorMessage !=''? GestureDetector(
            onTap: () {
              setState(() {
                errorMessage ='';
                _controllerEmail.clear();
                _controllerPassword.clear();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFFD700),
                ),
                
                child: Center(child: Text("OK")),
              ),
            ),
          ): Container(),
        ],
      ),
    ):Container();
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFD700),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      ),
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register',style: TextStyle(color: Color(0xFF00205B)),),
    );
  }

  // Widget _loginOrRegistration() {
  //   return TextButton(
  //     onPressed: () {
  //       setState(() {
  //         isLogin = !isLogin;
  //       });
  //     },
  //     child: Text(isLogin ? "Register instead" : "Login instead"),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("Redbull"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 10),
              child: SizedBox(
                height: 150,
                child: _errorMessage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                      children: [
                        _entryField('Email', _controllerEmail),
                        _entryField('Password', _controllerPassword),
                      ],
                    ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  _submitButton(),
                ],
              ),
            ),
            
            
            
          ],
        ),
      ),
      bottomNavigationBar:  
              Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // isLogin ? _submitButton() : _loginOrRegistration(),
                  // isLogin ? _loginOrRegistration() : _submitButton(),
                  Loginregisterbutton(onTabChange:(p0) {
                    setState(() {
                      if (p0 == 0) {
                        isLogin = true;
                      } else if (p0 == 1) {
                        isLogin =false;
                      }
                    });
                  },)
                  
                ],
              ),
            ),

    );
  }
}
