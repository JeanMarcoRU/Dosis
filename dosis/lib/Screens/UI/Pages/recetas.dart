import 'package:flutter/material.dart';
import '../../../constants.dart';

class Recetas extends StatelessWidget {
  const Recetas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Recetas",
        style: TextStyle(
          fontSize: 35,
          color: kgreyDColor,
        ),
      ),
    );
  }
}
