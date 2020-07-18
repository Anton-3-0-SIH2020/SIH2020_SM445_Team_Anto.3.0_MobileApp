import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailsBox extends StatelessWidget {
  final String name;
  final String value;
  DetailsBox(this.name, this.value);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 0.06 * screenHeight,
      width: 0.85 * screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              '''$value''',
              style: Theme.of(context).textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
