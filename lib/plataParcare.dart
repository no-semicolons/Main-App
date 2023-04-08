import 'package:flutter/material.dart';
import 'package:polipay/drawerMenu.dart';
import 'package:polipay/main.dart';

class plataParcare extends StatefulWidget {
  final String email;
  final String nume;
  const plataParcare({Key? key, required this.email, required this.nume}) : super(key: key);

  @override
  _plataParcareState createState() => _plataParcareState();
}

class _plataParcareState extends State<plataParcare> {
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
              title: const Text("Ati achitat parcarea"),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                    });

                    //AICI TREBUIE INTORS LA PAGINA PRINCIPALA

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(email: email, nume: nume,)));
                  },
                ),
              ]);
        });
  }

  TextEditingController _controller = TextEditingController();
  String nrInmatriculare = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: new Text("Plata parcare", textAlign: TextAlign.center)),
      ),
      body: (Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Introduceti numarul de inmatriculare al masinii',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (input) {
                    setState(() {
                      nrInmatriculare = input;
                    });
                  }),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Do something with the text field value
              print('Text field value: $nrInmatriculare');

              // Clear the text field
              _controller.clear();
              setState(() {
                nrInmatriculare = '';
              });
              createAlertDialog(context);
            },
            child: Text('Submit'),
          ),
        ],
      )),
    );
  }
}