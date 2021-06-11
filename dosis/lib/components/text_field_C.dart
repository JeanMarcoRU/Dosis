import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class TextFieldC extends StatelessWidget {
  final Widget child;
  const TextFieldC({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kgreyDColor)),
      child: child,
    );
  }
}
