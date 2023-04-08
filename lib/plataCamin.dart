import 'package:flutter/material.dart';
import 'package:polipay/main.dart';
import 'package:polipay/drawerMenu.dart';

class plataCamin extends StatefulWidget {
  final String email;
  final String nume;
  const plataCamin({Key? key, required this.email, required this.nume}) : super(key: key);

  @override
  _plataCaminState createState() => _plataCaminState();
}

class _plataCaminState extends State<plataCamin> {

  TextEditingController _controller = TextEditingController();
  String luna = '';
  String email = '';
  String nume = '';

  void initState() {
    email = widget.email;
    nume = widget.nume;
  }

  createAlertDialog(BuildContext context, String str) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Ati achitat caminul pentru luna " + str),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                    });

                    //AICI TREBUIE INTORS LA PAGINA PRINCIPALA

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu (email: email, nume: nume,)));
                  },
                ),
              ]);
        });
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(child: new Text("Plata Camin", textAlign: TextAlign.center)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text(
                    'Introduceti datele corespunzatoare\n',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Luna',
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (input) {
                    setState(() {
                      luna = input;
                      print("luna este $luna");
                    });
                  }),
            ),
            Container(
              child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Alte comentarii',
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (input) {
                    setState(() {
                    });
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                // Do something with the text field value

                // Clear the text field
                _controller.clear();
                setState(() {
                });
                createAlertDialog(context, luna);
                luna = '';
              },
              child: Text('Submit'),
            ),
          ],
        ));
  }
}