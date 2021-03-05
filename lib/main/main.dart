import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iscacentral/screens/addContact.dart';
import 'package:iscacentral/screens/addSession.dart';
import 'package:iscacentral/screens/amela.dart';
import 'package:iscacentral/screens/ex.dart';
import 'package:iscacentral/screens/loginPage.dart';
import 'package:iscacentral/screens/shura.dart';


void main() async {

  bool USE_FIRESTORE_EMULATOR = false;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = Settings(
        host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final List<String> list = [];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'ISCA Central',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),

      initialRoute: "addSession",
      routes: {
        "login" : (context) => LoginPage(),
        "amela" : (context) => Amela(),
        "shura" : (context) => Shura(),
        "ex" : (context) => Ex(),
        "addSession" : (context) => AddSession(),
        "addContact" : (context) => AddContact(),
      },

      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }


}



class AddUserData extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Map UserData = {
    'full_name': "nsmr", // John Doe
    'company': "compani", // Stokes and Sons
    'age': 54 // 42
  };



  Future<void> addUser() {



    return users.add(UserData)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello title"),
      ),

      body:
      RaisedButton(
        onPressed: addUser,
        child: Text("Add Data"),
      ),
    );
  }
}

