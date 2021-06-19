import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';
import 'Body.dart';

class FormularioM extends StatefulWidget {
  final Medicamento medicamento;

  const FormularioM({Key key, this.medicamento}) : super(key: key);

  @override
  _FormularioMState createState() => _FormularioMState();
}

class _FormularioMState extends State<FormularioM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      //title: "Agregar Medicamento",
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SocalIcon(
          iconSrc: "assets/icons/cuack.svg",
          color: kgreyLColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "agregar medicamento",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
