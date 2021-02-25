import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iscacentral/model/persondetails.dart';
import 'package:url_launcher/url_launcher.dart';

class Amela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amela"),
      ),
      body: AmelaBody(),
    );
  }
}

class AmelaBody extends StatefulWidget {
  @override
  _AmelaBodyState createState() => _AmelaBodyState();
}

class _AmelaBodyState extends State<AmelaBody> {
  List<Person> persons = [];

  @override
  void initState() {
    super.initState();
    persons.add(Person("MD. Bodrul Amin", "Central Shura", "+8801725717136",
        "bodrulaminiu@gmail.com", "https://facebook.com/bodrulamin91"));

    persons.add(Person("MD. Bodrul Amin", "Central Shura", "+8801725717136",
        "bodrulaminiu@gmail.com", "https://facebook.com/bodrulamin91"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: personCard, itemCount: persons.length);
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


}
