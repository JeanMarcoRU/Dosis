import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/Screens/UI/Pages/medicinas.dart';
import 'package:flutter/material.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/rounded_input_field.dart';
import 'package:dosis/components/text_field_container.dart';
import 'package:dosis/constants.dart';

class formCategoria extends StatelessWidget {
  formCategoria({Key key}) : super(key: key);

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController emojiController = TextEditingController();
  CollectionReference _categoria =
      FirebaseFirestore.instance.collection("Categoria");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWhite(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            TextFieldContainer(
              child: TextField(
                controller: nombreController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: kPrimaryColor,
                  ),
                  labelText: "Nombre",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldContainer(
              child: TextField(
                controller: descripcionController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: kPrimaryColor,
                  ),
                  labelText: "Descripcion",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldContainer(
              child: TextField(
                controller: emojiController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: kPrimaryColor,
                  ),
                  hintText: "Emoji",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Guardar",
              press: () async {
                final String nombre = nombreController.text;
                final String descripcion = descripcionController.text;
                final String emoji = emojiController.text;
                if (nombre != null && descripcion != null && emoji != null) {
                  await _categoria.add({
                    "Nombre": nombre,
                    "Descripcion": descripcion,
                    "Emoji": emoji
                  });
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Medicinas();
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
