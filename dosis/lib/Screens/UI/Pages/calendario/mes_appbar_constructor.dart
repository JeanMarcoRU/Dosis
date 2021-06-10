import 'package:dosis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MesAppbar extends StatefulWidget {
  final Function press;
  bool isPressed;
  String mes;
  MesAppbar({
    Key key,
    this.press,
    this.isPressed,
    this.mes,
  }) : super(key: key);

  @override
  _MesAppbarState createState() => _MesAppbarState();
}

class _MesAppbarState extends State<MesAppbar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isPressed = !widget.isPressed;
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                widget.mes,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.isPressed ? kPrimaryColor : kmelroseColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
