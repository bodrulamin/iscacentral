

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      child: SizedBox(
        width: 500,
        child: Column(

          children: [

            Expanded(

              child: ListView.builder(
                  itemBuilder: personCard, itemCount: persons.length),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: dialogViewForInput);
                },
                child: Text("Add Person")),
          ],
        ),
      ),
    );
  }

  Widget personCard(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(

        leading: FaIcon(FontAwesomeIcons.solidUser),
        collapsedBackgroundColor: Colors.lime.shade50,
        expandedAlignment: Alignment.bottomLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.only(left: 20.0),
        subtitle:   Text(persons[index].designation),
        tilePadding: EdgeInsets.only(left: 25.0),
        title: Text(
          persons[index].name,
          style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
        ),
        children: [
          ListTile(
              isThreeLine: false,

              leading: Icon(Icons.phone),
              onTap: ()=>
                  launch("tel:${persons[index].phone}"),
              title: Text(persons[index].phone)),
          ListTile(

              leading: Icon(Icons.email),
              onTap: () => launch("mailto:${persons[index].email}"),
              title: Text(persons[index].email, )
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.facebook),
            onTap: () => launch(persons[index].fbLink),
            title: Text(persons[index].fbLink),
          ),
        ],
      ),
    );
  }


  Widget dialogViewForInput(BuildContext context) {
    String _name;
    String _desig;
    String _phone;
    String _email;
    String _fblink;

    Person newPerson =
        Person("name", "designation", "phone", "email", "fbLink");

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
                persons.add(newPerson);
              });

              Navigator.pop(context);
            },
            child: Text("Add"))
      ],
      content: Column(
        children: [
          Text("Enter Person Details"),
          TextFormField(onChanged: (value) => newPerson.name=value),
          TextFormField(onChanged: (value) => newPerson.designation=value),
          TextFormField(onChanged: (value) => newPerson.phone=value),
          TextFormField(onChanged: (value) => newPerson.email=value),
          TextFormField(onChanged: (value) => newPerson.fbLink=value ),
        ],
      ),
    );
  }
}
