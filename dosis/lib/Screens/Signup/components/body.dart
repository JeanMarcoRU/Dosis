import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/Login/login_screen.dart';
import 'package:dosis/Screens/Signup/components/background.dart';
import 'package:dosis/Screens/Signup/components/or_divider.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/components/already_have_an_account_acheck.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/rounded_input_field.dart';
import 'package:dosis/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dosis/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:dosis/components/text_field_container.dart';

class Body extends StatelessWidget {
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
                  hintText: "Correo Electrónico",
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
            SizedBox(height: size.height * 0.08),
            RoundedButton(
              text: "Regístrarse",
              color: kPrimaryLightColor,
              press: () {
                context.read<AuthenticationService>().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.00),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
