
import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("AddContact")),
      ),
      body: ContactDetails(),
     );
  }
}

class ContactDetails extends StatefulWidget {
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final int _fields = 10;

  List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(_fields, (i) => TextEditingController());
  }

  @override
  void dispose() {
    controllers.forEach((c) => c.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < _fields; i++)
                  TextField(
                    controller: controllers[i],
                    onChanged: (value) {
                      final controller = controllers[i];
                      print(
                          'Current field index is $i and new value is $value');
                    },
                  ),
                ElevatedButton(onPressed: () {
                  print(controllers[4].text.toString());
                }, child: Text("Submit")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*

class _ContactDetailsState extends State<ContactDetails> {

  int mancount = 50;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),

              for (var i=1;i<mancount;i++)
                Column(children:
                [
                  Text(i.toString()),
                  ElevatedButton(
                    child: Text("Button $i"),
                      onPressed: (){}),
                ]

                ),
            ],
          ),
        ],
      ),
    );
  }
}

*/
