import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:iscacentral/model/persondetails.dart';

class Session {
  String year = "";
  List<Person> amelaList = [];
  List<Person> shuraList = [];

  Session({this.year, this.amelaList, this.shuraList});

  Map<String, dynamic> toMap() {
    return {
      "year": year,
      "amelaList": amelaList.map((item) {
        return item.toMap();
      }).toList(),
      "shuraList": shuraList.map((item) {
        return item.toMap();
      }).toList(),
    };
  }

 

}
