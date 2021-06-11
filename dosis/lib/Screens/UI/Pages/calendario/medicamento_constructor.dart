import 'package:dosis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedicamentoBox extends StatefulWidget {
  final Function press;
  final Color userColor;
  bool isPressed;
  String nombre;
  String dosis;
  String hora;
  String emoji;
  MedicamentoBox({
    Key key,
    this.press,
    this.isPressed = false,
    this.nombre,
    this.dosis,
    this.hora,
    this.userColor = userblueColor,
    this.emoji = "⚕️",
  }) : super(key: key);

  @override
  _MedicamentoBoxState createState() => _MedicamentoBoxState();
}

class _MedicamentoBoxState extends State<MedicamentoBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 0, right: 20),
          width: 40 /*MediaQuery.of(context).size.width * 0.1*/,
          child: Text(
            widget.hora,
            style: TextStyle(
              color: kgreyDColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(15),
            height: 80,
            //width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: widget.userColor,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        /*image: const DecorationImage(
                          image: NetworkImage(
                              'https://ichef.bbci.co.uk/news/640/cpsprodpb/1DD7/production/_102793670_1.jpg'),
                          fit: BoxFit.cover,
                        ),*/
                      ),
                      /*child: Icon(
                        Icons.beach_access,
                        color: Colors.blue,
                        size: 36.0,
                      ),*/
                      child: Center(
                        child: Text(
                          widget.emoji,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.nombre,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.dosis,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.hora,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: widget.isPressed
                        ? kPrimaryColor
                        : Colors.white.withOpacity(0.5),
                  ),
                  padding: EdgeInsets.only(right: 0),
                  child: Transform.scale(
                    scale: 2.0,
                    child: Checkbox(
                      activeColor: kPrimaryColor,
                      value: widget.isPressed,
                      onChanged: (bool value) {
                        setState(() {
                          widget.isPressed = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
