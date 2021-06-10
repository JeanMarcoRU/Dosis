import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MesAppbar extends StatefulWidget {
  final Function press;
  bool isPressed;
  MesAppbar({
    Key key,
    this.press,
    this.isPressed,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: EdgeInsets.all(0),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: widget.isPressed ? Colors.greenAccent : Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Colors.greenAccent),
                ),
                child: Center(
                  child: Text(
                    "widget.perfil.letralogo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          widget.isPressed ? Colors.white : Colors.greenAccent,
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
