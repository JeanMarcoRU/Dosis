import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Color color;
  final int index;
  final int currentIndex;
  final double size;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.color,
    this.index,
    this.currentIndex,
    this.press,
    this.size = 28,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 10),
        //padding: EdgeInsets.all(0),
        //color: color,
        child: SvgPicture.asset(
          iconSrc,
          height: size,
          width: size,
          color: color,
        ),
      ),
    );
  }
}
