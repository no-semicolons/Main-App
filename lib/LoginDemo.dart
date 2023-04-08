import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:polipay/CreateAccount.dart';
import 'package:polipay/CreeazaContNumePrenume.dart';
import 'package:polipay/auth.dart';
import 'package:polipay/drawerMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {

  final User? user = Auth().currentUser;
  String? errorMessage = '';
  bool isLogin = true;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void signInWithEmailAndPassword(context) async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text);

      String emailS = 'a';
      String numeS = 'a';

      DatabaseReference ref = FirebaseDatabase(databaseURL: "https://polipay-default-rtdb.europe-west1.firebasedatabase.app/").reference().child(_controllerEmail.text.split('@')[0]);
      DataSnapshot snapshot = await ref.child('prenume').get();
      if (snapshot.exists) {
        numeS = snapshot.value.toString();
      }
      ref = FirebaseDatabase(databaseURL: "https://polipay-default-rtdb.europe-west1.firebasedatabase.app/").reference().child(_controllerEmail.text.split('@')[0]);
      snapshot = await ref.child('email').get();
      if (snapshot.exists) {
        emailS = snapshot.value.toString();
      }
      // verificare
      await Navigator.push(context, MaterialPageRoute(builder: (_) => Menu(email: emailS, nume: numeS)));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        print(errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //upb image
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,

                    child: Image.asset('assets/upb_vect.jpg')),
              ),
            ),
            //email button
            const SizedBox(
              height: 25,
            ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controllerEmail,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Introduceti un email valid'),
              ),
            ),
            //parola button
              Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controllerPassword,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parola',
                    hintText: 'Introduceti-va parola'),
              ),
            ),const SizedBox(
              height: 25,
            ),

            ElevatedButton(
              onPressed: () => signInWithEmailAndPassword(context),

              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const CreateAccount()));
              },
              child: const Text(
                  "Nu ai cont? Creaza-ti unul!",
                  style: TextStyle(color: Colors.black, fontSize: 15)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

