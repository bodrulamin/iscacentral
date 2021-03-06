import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iscacentral/model/persondetails.dart';
import 'package:iscacentral/model/session.dart';
import 'package:iscacentral/widgets/personCard.dart';
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
  List<Person> amelaList = [];
  List<Person> shuraList = [];
  final yearTec = TextEditingController();

  @override
  void initState() {
    print("staten loaded");

    super.initState();
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');

    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      print(allData);
    }

    getData();
  }

  @override
  Widget build(BuildContext context) {
    String currentYear = "";
    print("widet loaded");

    return SizedBox(
      width: 500,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: FaIcon(FontAwesomeIcons.calendar),
                labelText: 'Session Year',
              ),
              controller: yearTec,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: amelaCardBuilder, itemCount: amelaList.length),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, builder: dialogViewForInput);
                  },
                  child: Text("Add Person")),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    Session session = Session(
                        shuraList: shuraList,
                        year: yearTec.text.toString(),
                        amelaList: amelaList);

                    CollectionReference iscacentralapp =
                        FirebaseFirestore.instance.collection('iscacentralapp');

                    // Call the user's CollectionReference to add a new user
                    return iscacentralapp
                        .doc(session.year)
                        .set(session.toJson())
                        .then((value) => print("User Added"))
                        .catchError(
                            (error) => print("Failed to add user: $error"));
                  },
                  child: Text("Save")),
            ],
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  Widget dialogViewForInput(BuildContext context) {
    Person newPerson = Person.namedParams();

    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              print("canceled");
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              setState(() {
                amelaList.add(newPerson);
              });

              Navigator.pop(context);
            },
            child: Text("Add"))
      ],
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text("Enter Person Details"),
            TextFormField(
                decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.user),
                  labelText: 'Name *',
                ),
                onChanged: (value) => newPerson.name = value),
            TextFormField(
                decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.briefcase),
                  labelText: 'Designation',
                ),
                onChanged: (value) => newPerson.designation = value),
            TextFormField(
                decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.phone),
                  labelText: 'Phone',
                ),
                onChanged: (value) => newPerson.phone = value),
            TextFormField(
                decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.envelope),
                  labelText: 'Email',
                ),
                onChanged: (value) => newPerson.email = value),
            TextFormField(
                decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.facebookF),
                  labelText: 'Facebook Link',
                ),
                onChanged: (value) => newPerson.fbLink = value),
          ],
        ),
      ),
    );
  }

  Widget amelaCardBuilder(BuildContext context, int index) {
    return personCard(context, amelaList, index);
  }
}
