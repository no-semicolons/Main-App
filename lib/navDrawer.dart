import 'package:polipay/meniuParcare.dart';
import 'package:flutter/material.dart';
import 'package:polipay/plataCamin.dart';
import 'package:polipay/plataRestante.dart';
import 'package:polipay/plataScolarizare.dart';

class SideMenu extends StatefulWidget {
  final String email;
  final String nume;
  const SideMenu({Key? key, required this.email, required this.nume}) : super(key: key);

  @override
  State<SideMenu> createState() => NavDrawer();
}

class NavDrawer extends State<SideMenu> {
  String email = '';
  String nume = '';

  void initState() {
    email = widget.email;
    nume = widget.nume;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                      alignment: Alignment.center,
                      //width: double.infinity - 10,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/polipay_logo.png'),
                      ))),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profilul meu'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.car_crash),
            title: Text('Parcare'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => meniuParcare(email: email,nume: nume,)))},
          ),
          ExpansionTile(
            leading: Icon(Icons.payment),
              title: Text('Plata Taxe'),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Plata Scolarizare'),
                onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => plataScolarizare(email: email,nume: nume,)))},
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Plata Restante'),
                onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => plataRestante(email: email,nume: nume,)))},
              ),
              ListTile(
                leading: Icon(Icons.house),
                title: Text('Plata Camin'),
                onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => plataCamin(email: email,nume: nume,)))},
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          const SizedBox(height: 220),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              color: Colors.blue,
              height: 50,
              alignment: Alignment.bottomCenter,
              child: const Center(
                child: Text(
                  'Meniu',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
