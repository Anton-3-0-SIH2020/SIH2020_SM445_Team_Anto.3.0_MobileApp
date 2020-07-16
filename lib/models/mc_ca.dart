import 'package:flutter/cupertino.dart';

class BseCa {
  String companyName;
  String purpose;
  String anouncment;
  String recordDate;
  String exDate;
  String bcStartDate;
  String bcEndDate;
  String ndStartDate;
  String ndEndDate;
  String actualPaymentDate;
  BseCa(
      {@required this.actualPaymentDate,
      @required this.bcEndDate,
      @required this.bcStartDate,
      @required this.exDate,
      @required this.ndEndDate,
      @required this.ndStartDate,
      @required this.purpose,
      @required this.recordDate,
      @required this.companyName,
      @required this.anouncment});
}

//{
//  "company_name": "Kuantum Papers",
//  "purpose": "SPLITS from Old FV 10 to New FV 1",
//  "anouncement": "None",
//  "record_date": "None",
//  "ex-date": "14-07-2020",
//  "bc_start_date": "None",
//  "bc_end_date": "None",
//  "nd_start_date": "None",
//  "nd_end_date": "None",
//  "actual_payment_date": "None"
//}
