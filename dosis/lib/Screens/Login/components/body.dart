import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
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
import 'package:encrypt/encrypt.dart' as EncryptAux;

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  static List perfileslist = [];
  static String user, password;

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
              hintText: "Email",
              icon: Icons.mail,
              onChanged: (value) {
                user = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
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
                encrypted(password);
                cargaPerfiles();
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

  void cargaPerfiles() async {
    perfileslist = [];
    perfiles.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Perfil");

    QuerySnapshot perfilesQS = await collectionReference.get();

    if (perfilesQS.docs.length != 0) {
      for (var doc in perfilesQS.docs) {
        //print(doc.data());
        perfileslist.add(doc.data());
      }
    }

    for (var i = 0; i < perfileslist.length; i++) {
      perfiles.add(Perfil(
          letralogo: perfileslist[i]["letralogo"],
          avatar: perfileslist[i]["avatar"],
          nombre: perfileslist[i]["nombre"],
          apellido1: perfileslist[i]["apellido1"],
          apellido2: perfileslist[i]["apellido2"],
          fechaNacimiento: "hay que pasarlo a fecha",
          edad: perfileslist[i]["edad"],
          color: getColor(perfileslist[i]["color"])));
    }
  } //void

  String encrypted(String texto) {
    final plainText = texto;
    final key = EncryptAux.Key.fromUtf8('my32lengthsupersecretnooneknows5');
    final iv = EncryptAux.IV.fromLength(16);

    final encrypter = EncryptAux.Encrypter(EncryptAux.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    print(encrypted
        .base64); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
    return encrypted.base64;
  }

  Color getColor(String color) {
    switch (color) {
      case "userpinkColor":
        {
          return userpinkColor;
        }
        break;

      case "userblueColor":
        {
          return userblueColor;
        }
        break;

      case "userpurpleColor":
        {
          return userpurpleColor;
        }
        break;

      case "usergreenColor":
        {
          return usergreenColor;
        }
        break;

      case "userorangeColor":
        {
          return userorangeColor;
        }
        break;

      default:
        {
          return userblueColor;
        }
        break;
    }
  }
}
