import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿No tiene una cuenta? " : "¿Ya tienes una cuenta? ",
          style: TextStyle(color: kPrimaryLightColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Regístrese" : "Iniciar sesión",
            style: TextStyle(
              color: kPrimaryLightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
