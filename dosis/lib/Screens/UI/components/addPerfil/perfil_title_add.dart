import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilTittleAdd extends StatelessWidget {
  const PerfilTittleAdd({
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
