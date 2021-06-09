import 'package:dosis/Classes/perfiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilAppbar extends StatelessWidget {
  final Perfil perfil;
  final Function press;
  final int i;
  const PerfilAppbar({
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
            height: 110 / 2,
            width: 110 / 2,
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
                  fontSize: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
