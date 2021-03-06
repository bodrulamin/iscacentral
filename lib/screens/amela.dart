import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iscacentral/model/persondetails.dart';
import 'package:iscacentral/model/session.dart';
import 'package:iscacentral/widgets/personCard.dart';
import 'package:url_launcher/url_launcher.dart';

class Amela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amela"),
      ),
      body: GetUserName("2021"),
    );
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;
  List<Person> amelaList = [];
  List<Person> shuraList = [];

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference iscacentralapp =
        FirebaseFirestore.instance.collection('iscacentralapp');

    return FutureBuilder<DocumentSnapshot>(
      future: iscacentralapp.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            Session session = Session.fromJson(data);

            amelaList = session.amelaList;
            shuraList = session.shuraList;
            // Person person = new Person();
            // person.name = "bodrul amin";
            // person.designation = "idb";
            // person.phone = "01725717136";
            // amelaList.add(person);

            return ListView.builder(
                itemBuilder: amelaCardBuilder, itemCount: amelaList.length);
          }

          return Text("loading");
        } else {
          return Text("Document not exists");
        }
      },
    );
  }

  Widget amelaCardBuilder(BuildContext context, int index) {
    return personCard(context, amelaList, index);
  }
}
