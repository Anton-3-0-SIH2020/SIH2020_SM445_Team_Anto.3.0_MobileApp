import 'package:flutter/material.dart';

class PredictedCaModel {
  String securityName;
  String purpose;
  String date;
  String content;
  PredictedCaModel({
    @required this.securityName,
    @required this.purpose,
    @required this.date,
    @required this.content,
  });
}

//{
//"security_name": "HG Infra Engineering",
//"purpose": "-",
//"date": "-",
//"content": "HG Infra Engineering today fixed a price band of Rs 263-270 per share for its initial public offering (IPO), through which the company is expected to raise Rs 462 crore."
//}
