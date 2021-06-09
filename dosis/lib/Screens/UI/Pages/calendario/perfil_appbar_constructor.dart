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
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: EdgeInsets.all(0),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1,
                    color: perfil.color,
                  ),
                ),
                child: Center(
                  child: Text(
                    perfil.letralogo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: perfil.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
