import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iscacentral/model/persondetails.dart';
import 'package:iscacentral/widgets/personCard.dart';
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
    Person b = Person();
    b.name = "bodrulamin";

    persons.add(Person());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: personItemBuilder, itemCount: persons.length);
  }

  Widget personItemBuilder(BuildContext context, int index) {
    return personCard(context, persons, index);
  }
}
