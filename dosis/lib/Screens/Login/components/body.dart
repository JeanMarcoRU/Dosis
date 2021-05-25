import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
//import 'package:dosis/Screens/UI/ui.dart';
import 'package:dosis/components/forgot_password.dart';
import 'package:dosis/main.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/Login/components/background.dart';
import 'package:dosis/Screens/Signup/signup_screen.dart';
import 'package:dosis/components/already_have_an_account_acheck.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dosis/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:dosis/components/text_field_container.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            TextFieldContainer(
              child: TextField(
                controller: emailController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: kPrimaryColor,
                  ),
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: passwordController,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  hintText: "Contraseña",
                  border: InputBorder.none,
                ),
              ),
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
              color: kPrimaryLightColor,
              press: () {
                context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
                );
                //cargaPerfiles();
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
