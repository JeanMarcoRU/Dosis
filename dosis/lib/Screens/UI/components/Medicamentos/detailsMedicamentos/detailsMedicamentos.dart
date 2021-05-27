import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';

import 'package:dosis/Screens/UI/components/Medicamentos/detailsMedicamentos/components/body.dart';

class detailsMedicamento extends StatelessWidget {
  final Medicamento medicamento;

  const detailsMedicamento({Key key, this.medicamento}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(
        medicamento: medicamento,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SocalIcon(
          iconSrc: "assets/icons/cuack.svg",
          color: kgreyLColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
