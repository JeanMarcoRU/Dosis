import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Screens/Signup/components/backgroundPassword.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dosis/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:dosis/components/text_field_container.dart';

class Body extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundPassword(
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
              text: "Cambiar Contraseña",
              color: kPrimaryLightColor,
              press: () {
                context.read<AuthenticationService>().changePassword(
                      passwordController.text.trim(),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
