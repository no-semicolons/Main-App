import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polipay/LoginDemo.dart';
import 'package:firebase_database/firebase_database.dart';

class CreeazaContNumePrenumes extends StatefulWidget {

  final String id;
  const CreeazaContNumePrenumes({Key? key, required this.id}) : super(key: key);

  @override
  State<CreeazaContNumePrenumes> createState() => _CreeazaContNumePrenumesState();
}

class _CreeazaContNumePrenumesState extends State<CreeazaContNumePrenumes> {
  @override

  String idHere = "";
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerNume = TextEditingController();
  final TextEditingController _controllerPrenume = TextEditingController();
  final TextEditingController _controllerFaculty = TextEditingController();
  final TextEditingController _controllerYear = TextEditingController();
  void initState()
  {
    idHere = widget.id;
  }

  bool writtenName = false;
  bool writtenSurname = false;
  bool writtenFaculty = false;
  bool writtenYear = false;

  void uploadToDatabase(context) async {
    DatabaseReference ref = FirebaseDatabase(databaseURL: "https://polipay-default-rtdb.europe-west1.firebasedatabase.app/").reference().child(idHere);
    ref.set({
      'name': _controllerNume.text,
      'prenume': _controllerPrenume.text,
      'faculty': _controllerFaculty.text,
      'year': _controllerFaculty.text
    });
    await Navigator.push(context, MaterialPageRoute(builder: (_) => LoginDemo()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Creaza Cont"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
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
                controller: _controllerNume,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nume',
                    hintText: 'Introduceti-va numele'),
                onChanged: (input){
                  setState(() {
                    writtenName = true;
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
                controller: _controllerPrenume,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Prenumele',
                    hintText: 'Introduceti-va prenumele'),
                onChanged: (input){
                  setState(() {
                    writtenSurname = true;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controllerFaculty,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Facultatea',
                    hintText: 'Introduceti-va facultatea'),
                onChanged: (input){
                  setState(() {
                    writtenFaculty = true;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controllerYear,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Anul',
                    hintText: 'Introduceti anul de studiu'),
                onChanged: (input){
                  setState(() {
                    writtenYear = true;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: writtenName && writtenSurname && writtenFaculty && writtenYear,
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: FloatingActionButton(
                  shape: const Border(),
                  onPressed: () {
                    uploadToDatabase(context);
                  },
                  child: const Text(
                    'Salveaza',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
