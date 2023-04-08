import 'package:polipay/main.dart';
import 'package:flutter/material.dart';
//import 'package:fake_desktop/plataCamin.dart';
import 'package:polipay/plataParcare.dart';

class meniuParcare extends StatefulWidget {
  final String email;
  final String nume;
  const meniuParcare({Key? key, required this.email, required this.nume}) : super(key: key);

  @override
  _meniuParcareState createState() => _meniuParcareState();
}

class _meniuParcareState extends State<meniuParcare> {
  String email = '';
  String nume = '';

  void initState() {
    email = widget.email;
    nume = widget.nume;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(child: new Text("Meniu Parcare", textAlign: TextAlign.center)),
        ),
        body: Column(
          children: [
            Padding(
              //padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(bottom: 50),
              child: Container(
                //margin: const EdgeInsets.only(left: 100),
                  width: double.infinity,
                  height: 150,
                  color: const Color.fromARGB(255, 19, 10, 51),
                  child: const Center(
                    child: Text(
                      'Alegeti durata parcarii',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  )),
            ),
            Row(
              children: [
                SizedBox(width: 60),
                Container(
                  width: 100,
                  height: 100,
                  child: (TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 19, 10, 51)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: Text('o zi'),
                      onPressed: () {

                        //ESTE DOAR TEMPORAR, TREBUIE PUSA PLATA DE PARCARE

                        //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => plataParcare(email: email, nume: nume,)));
                      })),
                ),
                SizedBox(width: 60),
                Container(
                  // margin: const EdgeInsets.only(left: 150),
                  width: 100,
                  height: 100,
                  child: (TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 19, 10, 51)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: Text('o saptamana'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => plataParcare(email: email, nume: nume,)));
                        //TBD
                      })),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                  width: double.infinity,
                  height: 100,
                  child: const Center(
                    child: (Text(
                      'Tarife parcare:\n'
                          'O zi - 7 lei\n'
                          'O saptamana -40 lei',
                      style: TextStyle(fontSize: 30),
                    )),
                  )),
            )
          ],
        ));
  }
}