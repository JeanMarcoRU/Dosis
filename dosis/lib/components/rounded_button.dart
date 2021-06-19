import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double ancho, largo, fontSize, paddingV, paddingH;
  final BoxDecoration decoration;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.ancho,
    this.largo,
    this.fontSize = 22,
    this.paddingV = 18,
    this.paddingH = 40,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
    this.decoration,
    TextStyle style,
    List<Widget> children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: ancho,
      height: largo,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding:
              EdgeInsets.symmetric(vertical: paddingV, horizontal: paddingH),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
