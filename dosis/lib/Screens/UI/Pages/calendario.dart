import 'package:flutter/material.dart';
import '../../../constants.dart';

class Calendario extends StatelessWidget {
  const Calendario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Calendario",
        style: TextStyle(
          fontSize: 35,
          color: kgreyDColor,
        ),
      ),
    );
  }
}
