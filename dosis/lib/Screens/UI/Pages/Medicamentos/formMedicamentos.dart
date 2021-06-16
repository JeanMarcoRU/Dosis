//import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/Screens/UI/ui.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/text_field_C.dart';
import 'package:dosis/constants.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

//import 'package:dropdownfield/dropdownfield.dart';

//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:intl/intl.dart';
//import 'package:dropdown_formfield/dropdown_formfield.dart';

class formMedicamentos extends StatefulWidget {
  final Categoria categoria;
  final Perfil perfil;
  final int i;
  formMedicamentos({
    Key key,
    this.categoria,
    this.perfil,
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
  String categValue;
  String perfil_elegido;
  String color_elegido;
  List<String> opcionesCategoria = [];
  List<String> opColores = [];
  List<String> opPerfiles = [];
  List opciones = [];
  static List<String> diasS = ["lun", "mar", "mie", "jue", "vie", "sáb", "dom"];
  final _items = diasS.map((e) => MultiSelectItem<String>(e, e)).toList();
  List<String> _selecteds = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(categorias);
    cargarOpciones();
    opcionesColores();
    elegirPerfiles();
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
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.white)),
              child: MultiSelectChipField<String>(
                title: Text(
                  "Días",
                  style: TextStyle(
                    color: kgreyDColor,
                    fontSize: 16,
                  ),
                ),
                items: _items,
                chipColor: userblueColor,
                textStyle: TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0)),
                headerColor: Colors.white,
                selectedChipColor: kPrimaryColor,
                selectedTextStyle: TextStyle(color: Colors.white),
                onTap: (values) {
                  _selecteds = values;
                  print(_selecteds);
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: horaController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Hora",
                  hintText: "HH:MM (format 24h)",
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
                    value: categValue,
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
                        categValue = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Text(
                    "Elegir Perfil:",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                      height: 0,
                      color: kgreyDColor,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: color_elegido,
                    items:
                        opColores.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: buscarPerfil(getColor(value)),
                        child: Text(buscarPerfil(getColor(value)),
                            style: TextStyle(color: getColor(value))),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        color_elegido = newValue;
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
                print("que pasa?");
                print(_selecteds);
                print(filtrarDias(_selecteds));
                final String nombre = nombreController.text;
                final String dosis = dosisController.text;
                final DateTime tomaDesde =
                    DateTime.parse(tomaDesdeController.text);
                final DateTime tomaHasta =
                    DateTime.parse(tomaHastaController.text);
                List diasC = filtrarDias(_selecteds);
                final String hora = horaController.text;
                final String colorM = getColorObj(buscarColor(color_elegido));
                await _medicamento.add({
                  "Nombre": nombre,
                  "Dosis": dosis,
                  "Período de Toma Desde": tomaDesde,
                  "Período de Toma Hasta": tomaHasta,
                  "Días": diasC,
                  "Hora": hora,
                  "CategoriaP": categValue,
                  "Color": colorM
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

  List<dynamic> filtrarDias(List<String> dias) {
    List resultado = [false, false, false, false, false, false, false];
    for (var i = 0; i < dias.length; i++) {
      if (dias[i] == "lun") {
        resultado[0] = true;
      }
      if (dias[i] == "mar") {
        resultado[1] = true;
      }
      if (dias[i] == "mie") {
        resultado[2] = true;
      }
      if (dias[i] == "jue") {
        resultado[3] = true;
      }
      if (dias[i] == "vie") {
        resultado[4] = true;
      }
      if (dias[i] == "sáb") {
        resultado[5] = true;
      }
      if (dias[i] == "dom") {
        resultado[6] = true;
      }
    }
    return resultado;
  }

  void cargarOpciones() async {
    opcionesCategoria.clear();
    for (var i = 0; i < categorias.length; i++) {
      opcionesCategoria.add(categorias[i].nombre);
    }
    print(opcionesCategoria);
  }

  void opcionesColores() async {
    opColores.clear();
    for (var i = 0; i < perfiles.length; i++) {
      opColores.add(getColorString(perfiles[i].color));
    }
    print(opColores);
  }

  void elegirPerfiles() async {
    opPerfiles.clear();
    for (var i = 0; i < perfiles.length; i++) {
      opPerfiles.add(perfiles[i].nombre);
    }
    print(opPerfiles);
  }

  //Busca el nombre perfil por color
  String buscarPerfil(Color color) {
    String resultado = "";
    for (var i = 0; i < perfiles.length; i++) {
      if (perfiles[i].color == color) {
        resultado = perfiles[i].nombre;
        break;
      }
    }
    return resultado;
  }

  // Busca el color de perfil por nombre de perfil
  Color buscarColor(String perfil) {
    Color resultado;
    for (var i = 0; i < perfiles.length; i++) {
      if (perfiles[i].nombre == perfil) {
        resultado = perfiles[i].color;
        break;
      }
    }
    return resultado;
  }

  String getColorString(Color color) {
    if (color == userpinkColor) {
      return "Rosado";
    }
    if (color == userblueColor) {
      return "Azul";
    }
    if (color == userpurpleColor) {
      return "Morado";
    }
    if (color == usergreenColor) {
      return "Verde";
    }
    if (color == usergreyColor) {
      return "Gris";
    }
    if (color == userorangeColor) {
      return "Anaranjado";
    }
  }

  Color getColor(String color) {
    switch (color) {
      case "Rosado":
        {
          return userpinkColor;
        }
        break;

      case "Azul":
        {
          return userblueColor;
        }
        break;

      case "Morado":
        {
          return userpurpleColor;
        }
        break;

      case "Verde":
        {
          return usergreenColor;
        }
        break;

      case "Anaranjado":
        {
          return userorangeColor;
        }
        break;

      case "Gris":
        {
          return usergreyColor;
        }
        break;

      default:
        {
          return userblueColor;
        }
        break;
    }
  }

  String getColorObj(Color color) {
    if (color == userpinkColor) {
      return "userpinkColor";
    } else if (color == userblueColor) {
      return "userblueColor";
    } else if (color == userpurpleColor) {
      return "userpurpleColor";
    } else if (color == usergreenColor) {
      return "usergreenColor";
    } else if (color == userorangeColor) {
      return "userorangeColor";
    } else if (color == usergreyColor) {
      return "usergreyColor";
    } else {
      return "userblueColor";
    }
  }
}
