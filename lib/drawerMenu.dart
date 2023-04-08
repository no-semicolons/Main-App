import 'package:flutter/material.dart';
import 'package:polipay/navDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Menu extends StatefulWidget {
  final String email;
  final String nume;
  const Menu({Key? key, required this.nume, required this.email}) : super(key: key);

  @override
  State<Menu> createState() => MyMenuPage();
}

class MyMenuPage extends State<Menu> {
  String nume = '';
  String email = '';

  void initState() {
    email = widget.email;
    nume = widget.nume;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(email: email, nume: nume,),
      appBar: AppBar(
        title: Text('Meniu'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/UPB-Logo-with-text.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                child: Center(
                  child: Text(
                    'Bine ai venit, $nume!',
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 190),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'Pentru a raporta bug-uri, puteti trimite un mail catre bugsAreFeatures@gmail.com',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

