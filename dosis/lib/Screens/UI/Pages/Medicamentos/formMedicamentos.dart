//import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/Screens/UI/ui.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/text_field_C.dart';
import 'package:dosis/constants.dart';

//import 'package:dropdownfield/dropdownfield.dart';

//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:intl/intl.dart';
//import 'package:dropdown_formfield/dropdown_formfield.dart';

class formMedicamentos extends StatefulWidget {
  final Categoria categoria;
  final int i;
  formMedicamentos({
    Key key,
    this.categoria,
    this.i,
  }) : super(key: key);

  @override
  _formMedicamento_State createState() => _formMedicamento_State();
}

class _formMedicamento_State extends State<formMedicamentos> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController dosisController = TextEditingController();
  final TextEditingController tomaDesdeController = TextEditingController();
  final TextEditingController tomaHastaController = TextEditingController();
  final TextEditingController diasController = TextEditingController();
  final TextEditingController horaController = TextEditingController();
  CollectionReference _medicamento =
      FirebaseFirestore.instance.collection("Medicamentos");
  String dropdownValue;
  List<String> opcionesCategoria = [];

  void cargarOpciones() async {
    opcionesCategoria.clear();
    for (var i = 0; i < categorias.length; i++) {
      opcionesCategoria.add(categorias[i].nombre);
    }
    print(opcionesCategoria);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(categorias);
    cargarOpciones();
    print(opcionesCategoria);
    return BackgroundWhite(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: nombreController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: dosisController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Dosis",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: tomaDesdeController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Período de Toma Desde",
                  hintText: "aaaa-mm-dd",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: tomaHastaController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Período de Toma Hasta",
                  hintText: "aaaa-mm-dd",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: diasController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Días",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: horaController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Hora",
                  border: InputBorder.none,
                ),
              ),
            ),
            /*
            DropDownField(
                value: accountname,
                required: true,
                strict: true,
                labelText: 'Account Name *',
                icon: Icon(Icons.account_balance),
                items: accountNames,
                setter: (dynamic newValue) {
                    accountname = newValue;
                }
            ),
            */
            SizedBox(height: size.height * 0.01),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Text(
                    "Seleccionar Categoría:",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                      height: 0,
                      color: kgreyDColor,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: dropdownValue,
                    style: TextStyle(color: kgreyDColor),
                    items: opcionesCategoria
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Guardar",
              press: () async {
                final String nombre = nombreController.text;
                final String dosis = dosisController.text;
                final DateTime tomaDesde =
                    DateTime.parse(tomaDesdeController.text);
                final DateTime tomaHasta =
                    DateTime.parse(tomaHastaController.text);
                final String dias = diasController.text;
                final String hora = horaController.text;
                await _medicamento.add({
                  "Nombre": nombre,
                  "Dosis": dosis,
                  "Período de Toma Desde": tomaDesde,
                  "Período de Toma Hasta": tomaHasta,
                  "Días": dias,
                  "Hora": hora
                });
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
          ],
        ),
      ),
    );
  }
}
