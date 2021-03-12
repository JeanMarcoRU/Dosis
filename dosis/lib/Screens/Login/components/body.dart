import 'package:dosis/Screens/UI/ui.dart';
import 'package:dosis/components/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/Login/components/background.dart';
import 'package:dosis/Screens/Signup/signup_screen.dart';
import 'package:dosis/components/already_have_an_account_acheck.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/rounded_input_field.dart';
import 'package:dosis/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/logow.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Cédula",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            ForgotPassword(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.08),
            RoundedButton(
              text: "Iniciar sesión",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ui();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.00),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
