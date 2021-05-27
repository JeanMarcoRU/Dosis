import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class MedicamentoObj extends StatelessWidget {
  final Medicamento medicamento;
  final Function press;
  final int i;
  const MedicamentoObj({
    Key key,
    this.medicamento,
    this.press,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          /*
          Container(
            ////padding: EdgeInsets.all(0),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(),
            ),
          ),

          Container(
            alignment: Alignment.center,
            height: 110,
            padding: EdgeInsets.all(5),
            child: Text("medicamento.nombre"),
            decoration: BoxDecoration(
                color: kgreyLColor, borderRadius: BorderRadius.circular(15)),
          ), */

          Container(
              alignment: Alignment.center,
              height: 110,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: kgreyLColor, borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                contentPadding: EdgeInsets.all(8.0),
                title: Text(medicamentos[i].nombre),
                subtitle: Text(medicamentos[i].dosis),
              )),
        ],
      ),
    );
  }
}
