import 'package:flutter/material.dart';

class Company {
  String exchange;
  String name;
  String code;
  int isFavorite;
  Company(
      {@required this.exchange,
      @required this.name,
      @required this.code,
      @required this.isFavorite});
}
//{
//  "exchange": "BSE",
//  "company": "BOMDYEING",
//  "code": "500020",
//}
