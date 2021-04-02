import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iscacentral/model/persondetails.dart';
import 'package:url_launcher/url_launcher.dart';


Widget personCard(BuildContext context,  List<Person> persons,int index) {



    return Card(
      child: ExpansionTile(
        leading: FaIcon(FontAwesomeIcons.solidUser),
        collapsedBackgroundColor: Colors.lime.shade50,
        expandedAlignment: Alignment.bottomLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.only(left: 20.0),
        subtitle: Text(persons[index].designation??""),
        tilePadding: EdgeInsets.only(left: 25.0),
        title: Text(
          persons[index].name??"",
          style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
        ),
        children: [
          ListTile(
              isThreeLine: false,
              leading: FaIcon(FontAwesomeIcons.phone),
              onTap: () => launch("tel:${persons[index].phone??""}"),
              title: Text(persons[index].phone??"")),
          ListTile(
              leading: FaIcon(FontAwesomeIcons.envelope),
              onTap: () => launch("mailto:${persons[index].email??""}"),
              title: Text(
                persons[index].email??"",
              )),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.facebookF),
            onTap: () => launch(persons[index].fbLink??""),
            title: Text(persons[index].fbLink??""),
          ),
        ],
      ),
    );
  }