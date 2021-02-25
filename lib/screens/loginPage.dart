import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            RaisedButton(
                child: Text("Amela"),
                onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, "amela", (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
