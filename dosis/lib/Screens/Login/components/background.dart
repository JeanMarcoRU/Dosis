import 'package:flutter/material.dart';

import '../../../constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Color color;
  const Background({
    Key key,
    this.color: kPrimaryColor,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: new BoxDecoration(color: color),
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
        ],
      ),
    );
  }
}
