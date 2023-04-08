import 'dart:async';

import 'package:flutter/material.dart';
import 'package:polipay/CreeazaContNumePrenume.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:polipay/auth.dart';
import 'package:polipay/LoginDemo.dart';
import 'package:firebase_database/firebase_database.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool writtenEmail = false;
  bool writtenEmailConfirm = false;
  bool writtenPassword = false;
  String? errorMessage = '';

  final User? user = Auth().currentUser;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void createUserWithEmailAndPassword(context) async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text);
      // DatabaseReference ref = FirebaseDatabase(databaseURL: "https://polipay-default-rtdb.europe-west1.firebasedatabase.app/").reference().child('DoamnaCartale').child('email');
      // ref.onValue.listen((DatabaseEvent event) {
      //   DataSnapshot snapshot = event.snapshot;
      //   print(snapshot.value);
      // });
      String id = _controllerEmail.text.split('@')[0];
      DatabaseReference ref = FirebaseDatabase(databaseURL: "https://polipay-default-rtdb.europe-west1.firebasedatabase.app/").reference().child(id);

      ref.update({
        'email': _controllerEmail.text
      });

      await Navigator.push(context, MaterialPageRoute(builder: (_) => CreeazaContNumePrenumes(id: id)));
      //await Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginDemo()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        print(errorMessage);
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: const Text("Creaza Cont"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/upb_vect.jpg')),
                ),
              ),
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
                  onChanged: (input){
                    setState(() {
                      writtenEmail = true;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(

                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmati email',
                      hintText: 'Rescrieti email-ul'),
                  onChanged: (input){
                    setState(() {
                      writtenEmailConfirm = true;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  controller: _controllerPassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Parola',
                      hintText: 'Introduceti-va parola'),
                  onChanged: (input){
                    setState(() {
                      writtenPassword = true;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Visibility(
                  visible: writtenEmail && writtenEmailConfirm && writtenPassword,
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                    child: FloatingActionButton(
                      shape: const Border(),
                      onPressed: () => createUserWithEmailAndPassword(context),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
              ),
            ]
        ),
      )
    );
  }
}
