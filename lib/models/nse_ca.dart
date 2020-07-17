import 'package:flutter/cupertino.dart';

class NseCa {
  String symbol;
  String companyName;
  String series;
  String faceValue;
  String purpose;
  String exDate;
  String recordDate;
  String bcStartDate;
  String bcEndDate;
  NseCa(
      {@required this.recordDate,
      @required this.purpose,
      @required this.exDate,
      @required this.bcStartDate,
      @required this.bcEndDate,
      @required this.companyName,
      @required this.faceValue,
      @required this.series,
      @required this.symbol});
}

//{
//  "symbol": "TATAPOWER",
//  "company_name": "Tata Power Company Limited",
//  "series": "EQ",
//  "face_value": "1",
//  "purpose": "Annual General Meeting/Dividend - Rs 1.55 Per Share",
//  "ex_date": "14-Jul-2020",
//  "record_date": null,
//  "bc_start_date": "16-Jul-2020",
//  "bc_end_date": "30-Jul-2020"
//}
