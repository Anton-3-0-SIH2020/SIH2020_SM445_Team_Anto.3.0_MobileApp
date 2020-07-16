import 'package:flutter/cupertino.dart';

class BseCa {
  String securityCode;
  String securityName;
  String exDate;
  String purpose;
  String recordDate;
  String bcStartDate;
  String bcEndDate;
  String ndStartDate;
  String ndEndDate;
  String actualPaymentDate;
  BseCa({
    @required this.actualPaymentDate,
    @required this.bcEndDate,
    @required this.bcStartDate,
    @required this.exDate,
    @required this.ndEndDate,
    @required this.ndStartDate,
    @required this.purpose,
    @required this.recordDate,
    @required this.securityCode,
    @required this.securityName,
  });
}

//{
//  "security_code": "500020",
//  "security_name": "BOMDYEING",
//  "ex_date": "08 Jul 2020",
//  "purpose": "Dividend - Rs. - 0.2000",
//  "record_date": "-",
//  "bc_start_date": "10 Jul 2020",
//  "bc_end_date": "15 Jul 2020",
//  "nd_start_date": "03 Jul 2020",
//  "nd_end_date": "09 Jul 2020",
//  "actual_payment_date": "-"
//}
