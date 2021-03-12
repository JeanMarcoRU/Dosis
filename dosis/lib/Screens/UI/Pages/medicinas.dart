import 'package:flutter/material.dart';
import '../../../constants.dart';

class Medicinas extends StatelessWidget {
  const Medicinas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Medicinas",
        style: TextStyle(
          fontSize: 35,
          color: kgreyDColor,
        ),
      ),
    );
  }
}
