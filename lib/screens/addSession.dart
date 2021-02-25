import 'package:flutter/material.dart';
import 'package:iscacentral/model/persondetails.dart';
import 'package:url_launcher/url_launcher.dart';

class AddSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Session"),
        ),
        body: SessionBody());
  }
}

class SessionBody extends StatefulWidget {
  @override
  _SessionBodyState createState() => _SessionBodyState();
}

class _SessionBodyState extends State<SessionBody> {
  List<Person> persons = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        alignment: Alignment.center,
        child: ListView(
          children: [
            Column(
              children: [
                Text("data"),
                SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemBuilder: personCard, itemCount: persons.length)),
                ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: dialogView);
                    },
                    child: Text("Add Person"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget personCard(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Text(persons[index].name),
          Text(persons[index].designation),
          TextButton(
              onPressed: () {
                launch("tel: ${persons[index].phone}");
              },
              child: Text(persons[index].phone)),
          Text(persons[index].email),
          Text(persons[index].fbLink),
        ],
      ),
    );
  }

  Widget dialogView(BuildContext context) {
    TextEditingController _nameTec;
    TextEditingController _desigTex;
    TextEditingController _phoneTec;
    TextEditingController _emailTec;
    TextEditingController _fblinkTec;
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
        TextButton(

            onPressed: () {


              Person newp = Person(_nameTec.text, _desigTex.text,
                  _phoneTec.text, _emailTec.text, _fblinkTec.text);
              persons.add(newp);

              print(persons);



            },
            child: Text("Add"))
      ],
      content: Column(
        children: [
          Text("Enter Person Details"),
          TextFormField(controller: _nameTec),
          TextFormField(controller: _desigTex),
          TextFormField(controller: _phoneTec),
          TextFormField(controller: _emailTec),
          TextFormField(initialValue: "https://fb.me/", controller: _fblinkTec),
        ],
      ),
    );
  }
}

