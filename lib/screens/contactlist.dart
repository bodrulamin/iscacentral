import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:url_launcher/url_launcher.dart';



class ContactList extends StatefulWidget {
  ContactList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    getcontact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: showContact,
        itemCount: list.length,
      ),
    );
  }

  Widget showContact(BuildContext context, int index) {
    final String nametitle = list[index];

   double   spacing = 3.0;

    return GestureDetector(
      child: Card(
        elevation: 3,
       color: Colors.amberAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.person,
              size: 80.0,),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list[index],
                   style: TextStyle(fontSize: 20.0),),
                  SizedBox(height: spacing),
                  Text('Designation'),
                  SizedBox(height: spacing),
                  Text('Phone'),
                  SizedBox(height: spacing),
                  Text('Fblink'),
                  SizedBox(height: spacing),
                  Text('Email'),
                  SizedBox(height: spacing),

                ],
              ),
            ],
          ),
        ),
      ),
      onTap:(){ showDetails(context,index);},
    );
  }

  void getcontact() {
    List<String> newlist = [];
    for (var i = 0; i < 6; i++) {
      newlist.add("$i kjhkljh");
    }

    newlist.add("tel:01725717456456136");
    
      setState(() {
        list = newlist;
      });

  }

  void showDetails(BuildContext context, int index) {

     showModalBottomSheet(context: context, builder: (context){
       return BottomSheet(
         onClosing: () {},
         builder: (context) {
           return Container(
             padding: EdgeInsets.all(10.0),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: FlatButton(
                     child: Text(
                       'Ligar',
                       style: TextStyle(color: Colors.red, fontSize: 20.0),
                     ),
                     onPressed: () {
                       launch(list[index]);
                       Navigator.pop(context);
                     },
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: FlatButton(
                     child: Text(
                       'Editar',
                       style: TextStyle(color: Colors.red, fontSize: 20.0),
                     ),
                     onPressed: () {
                       Navigator.pop(context);
                      },
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: FlatButton(
                     child: Text(
                       'Excluir',
                       style: TextStyle(color: Colors.red, fontSize: 20.0),
                     ),
                     onPressed: () {
                        setState(() {
                         list.removeAt(index);
                         Navigator.pop(context);
                       });
                     },
                   ),
                 ),
               ],
             ),
           );
         },
       );
     });


  }
}
