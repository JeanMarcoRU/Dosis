import 'package:dosis/Classes/perfiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PerfilAppbar extends StatefulWidget {
  final Perfil perfil;
  final Function press;
  final int i;
  bool isPressed;
  PerfilAppbar({
    Key key,
    this.perfil,
    this.press,
    this.i,
    this.isPressed,
  }) : super(key: key);

  @override
  _PerfilAppbarState createState() => _PerfilAppbarState();
}

class _PerfilAppbarState extends State<PerfilAppbar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isPressed = !widget.isPressed;
          widget.perfil.visibilidad = widget.isPressed;
          print("Ahora estoy acá");
          print(widget.perfil.visibilidad);
        });
      },
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
                  color: widget.isPressed ? widget.perfil.color : Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1,
                    color: widget.perfil.color,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.perfil.letralogo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          widget.isPressed ? Colors.white : widget.perfil.color,
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
