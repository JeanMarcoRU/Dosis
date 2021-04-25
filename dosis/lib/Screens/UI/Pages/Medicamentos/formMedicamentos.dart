//import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/Screens/UI/Pages/medicinas.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:intl/intl.dart';

class formMedicamento extends StatelessWidget {
  const formMedicamento({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWhite(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/pastillaDosis.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Nombre de Medicamento",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Perfil",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Dosis",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Período Toma Desde",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Período Toma Hasta",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Días",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Hora",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Categoría",
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
