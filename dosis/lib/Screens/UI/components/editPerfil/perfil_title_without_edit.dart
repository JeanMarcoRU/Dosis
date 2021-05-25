import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/UI/components/editPerfil/edit_screen.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class PerfilTittleWithoutEdit extends StatelessWidget {
  const PerfilTittleWithoutEdit({
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
        ],
      ),
    );
  }
}
