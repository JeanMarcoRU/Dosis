import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../ui.dart';

class PerfilTittleWithAvatar extends StatelessWidget {
  const PerfilTittleWithAvatar({
    Key key,
    @required this.perfil,
  }) : super(key: key);

  final Perfil perfil;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(perfil.avatar),
          ),

          //Expanded(child: Image.asset(perfil.avatar)),
          Center(
            child: Text(
              perfil.nombre,
              style: TextStyle(
                color: perfil.color,
                fontSize: 40,
              ),
            ),
          ),
          Center(
            child: RoundedButton(
              text: "Editar",
              color: kPrimaryColor,
              textColor: Colors.white,
              fontSize: 20,
              paddingV: 3,
              paddingH: 10,
              ancho: 100,
              largo: 30,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ui();
                    },
                  ),
                );
              },
            ),
          ),
          /*Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(text: " \n"),
                ],
              )),
              SizedBox(
                width: 15,
              ),
              //Expanded(child: Image.asset(perfil.avatar)),
            ],
          )*/
        ],
      ),
    );
  }
}
