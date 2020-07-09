import 'package:flutter/material.dart';
import 'package:anton_sih_app/models/corporateaction.dart';

class DetailsDialog {
  information(BuildContext context, CorporateAction data) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Text(data.security_name,
                style: Theme.of(context).textTheme.headline2),
            actions: <Widget>[
              FlatButton(
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
              )
            ],
          );
        });
  }
}
