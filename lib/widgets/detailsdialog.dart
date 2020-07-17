import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailsDialog {
  information(BuildContext context, BseCa data) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Container(
              height: 0.35 * screenHeight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        data.securityName,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                    ),
                    Text(
                      "Security Code: ${data.securityCode}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "Ex-Date: ${data.exDate}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "Record Date: ${data.recordDate}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "Purpose: ${data.purpose}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "BC Start Date: ${data.bcStartDate}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "BC End Date: ${data.bcEndDate}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "ND Start Date: ${data.ndStartDate}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "ND End Date: ${data.ndEndDate}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    AutoSizeText(
                      "Actual Payment Date: ${data.actualPaymentDate}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Center(
                        child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF4035EF),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
            // title: Text(data.security_name,
            //     style: Theme.of(context).textTheme.headline2),
            // actions: <Widget>[
            // FlatButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   child: Text(
            //     'OK',
            //     style: TextStyle(
            //       fontSize: 18,
            //       color: Color(0xFF4035EF),
            //     ),
            //   ),
            // )
            // ],
          );
        });
  }
}
