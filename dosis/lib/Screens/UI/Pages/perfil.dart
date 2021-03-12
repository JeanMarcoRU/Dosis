import 'package:flutter/material.dart';
import '../../../constants.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Perfil",
        style: TextStyle(
          fontSize: 35,
          color: kgreyDColor,
        ),
      ),
    );
  }
}
