import 'package:flutter/material.dart';
import 'package:polipay/main.dart';
import 'package:polipay/drawerMenu.dart';

class plataScolarizare extends StatefulWidget {
  final String email;
  final String nume;
  const plataScolarizare({Key? key, required this.email, required this.nume}) : super(key: key);

  @override
  _plataScolarizareState createState() => _plataScolarizareState();
}

class _plataScolarizareState extends State<plataScolarizare> {
  String? _selectedItem = 'Anul 1';
  List<String> _dropdownItems = ['Anul 1', 'Anul 2', 'Anul 3', 'Anul 4'];
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
              title: const Text("Ati achitat plata de scolarizare"),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Menu(email: email, nume: nume,)));
                  },
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: new Text("Plata scolarizare", textAlign: TextAlign.center)),
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
              child: DropdownButton<String>(
                value: _selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                items: _dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
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