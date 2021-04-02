import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:iscacentral/model/persondetails.dart';

class Session {
  String year = "";
  List<Person> amelaList = [];
  List<Person> shuraList = [];

  Session({this.year, this.amelaList, this.shuraList});

  Map<String, dynamic> toJson() {
    return {
      "year": year,
      "amelaList": amelaList.map((item) {
        return item.toJson();
      }).toList(),
      "shuraList": shuraList.map((item) {
        return item.toJson();
      }).toList(),
    };
  }

  Session.fromJson(Map<String, dynamic> json)
  {
    year = json["year"];
    var al = json["amelaList"] as List<dynamic>;
    var sl = json["shuraList"] as List<dynamic>;

    List<Person> amlist = al.map((person) => Person.fromJson(person)).toList();
    List<Person> shlist = sl.map((person) => Person.fromJson(person)).toList();


  amelaList = amlist;
  shuraList = shlist;

  }
}
