import 'package:dosis/Classes/perfiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilObj extends StatelessWidget {
  final Perfil perfil;
  final Function press;
  final int i;
  const PerfilObj({
    Key key,
    this.perfil,
    this.press,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: perfiles[i].color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                perfiles[i].letralogo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              perfiles[i].nombre,
              style: TextStyle(
                color: perfiles[i].color,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
