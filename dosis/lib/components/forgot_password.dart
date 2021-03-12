import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class ForgotPassword extends StatelessWidget {
  final bool login;
  final Function press;
  const ForgotPassword({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Text(
            "¿Olvidaste tu contraseña?",
            style: TextStyle(
              color: kPrimaryLightColor,
              //fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
