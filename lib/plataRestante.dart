import 'package:flutter/material.dart';
import 'package:polipay/main.dart';
import 'package:polipay/drawerMenu.dart';

class plataRestante extends StatefulWidget {
  final String email;
  final String nume;
  const plataRestante({Key? key, required this.email, required this.nume}) : super(key: key);

  @override
  _plataRestanteState createState() => _plataRestanteState();
}

class _plataRestanteState extends State<plataRestante> {
  String restanta = '';
  String email = '';
  String nume = '';

  void initState() {
    email = widget.email;
    nume = widget.nume;
  }
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Ati achitat restanta la $restanta"),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(email: email, nume: nume,)));
                  },
                ),
              ]);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: new Text("Plata restante", textAlign: TextAlign.center)),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
                decoration: InputDecoration(
                  hintText: 'Facultatea',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (input) {
                  setState(() {});
                }),
          ),
          Container(
            child: TextField(
                decoration: InputDecoration(
                  hintText: 'Specializarea',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (input) {
                  setState(() {});
                }),
          ),
          Container(
            child: TextField(
                decoration: InputDecoration(
                  hintText: 'Materia',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (input) {
                  setState(() {
                    restanta = input;
                  });
                }),
          ),
          Container(
            child: TextField(
                decoration: InputDecoration(
                  hintText: 'Anul',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (input) {
                  setState(() {});
                }),
          ),
          Container(
            child: TextField(
                decoration: InputDecoration(
                  hintText: 'Seria',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (input) {
                  setState(() {});
                }),
          ),
          Container(
            child: TextField(
                decoration: InputDecoration(
                  hintText: 'Semestru',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (input) {
                  setState(() {});
                }),
          ),
          Container(
              child: ElevatedButton(
                child: (Text('Submit')),
                onPressed: () {
                  createAlertDialog(context);
                },
              )),
        ],
      ),
    );
  }
}