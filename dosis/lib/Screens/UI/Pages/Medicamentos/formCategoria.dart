import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/Screens/UI/Pages/medicinas.dart';
import 'package:flutter/material.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/rounded_input_field.dart';

class formCategoria extends StatelessWidget {
  const formCategoria({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWhite(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Nombre de Categoría",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Descripción",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Emoji",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Guardar",
              press: () {
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
