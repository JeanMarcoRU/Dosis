import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/Screens/UI/ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class Body extends StatefulWidget {
  final String emailUser = FirebaseAuth.instance.currentUser.email;
  final Categoria categoria;
  final Perfil perfil;
  final int i;
  Body({
    Key key,
    this.categoria,
    this.perfil,
    this.i,
  }) : super(key: key);

  @override
  _Body_State createState() => _Body_State();
}

class _Body_State extends State<Body> {
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
            SizedBox(height: size.height * 0.01),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "elegir perfil:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        height: 0,
                        color: Colors.black,
                      ),
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
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "nombre del medicamento",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        height: 0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextFieldC(
              child: TextField(
                controller: nombreController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  //labelText: "Nombre",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "dosis",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        height: 0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextFieldC(
              child: TextField(
                controller: dosisController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  //labelText: "Dosis",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "período de toma",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        height: 0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "desde",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.all(30),
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: kgreyDColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: tomaDesdeController,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              hintText: "aaaa-mm-dd",
                              //border: InputBorder.none
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "hasta",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.all(30),
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: kgreyDColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: tomaHastaController,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              //labelText: "Hasta",
                              hintText: "aaaa-mm-dd",
                              //border: InputBorder.none
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "horario",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        height: 0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                showHeader: false,
                selectedChipColor: kPrimaryColor,
                selectedTextStyle: TextStyle(color: Colors.white),
                onTap: (values) {
                  _selecteds = values;
                },
              ),
            ),
            Center(
              child: Text(
                "hora",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                  height: 0,
                  color: kgreyDColor,
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.all(30),
              height: 100,
              width: 120,
              child: Center(
                child: TextFieldC(
                  child: TextField(
                    controller: horaController,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "HH:MM",
                      border: InputBorder.none,
                    ),
                  ),
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
            SizedBox(height: size.height * 0.03),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "elegir categoría",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.all(30),
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: kgreyDColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonFormField<String>(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "guardar",
              textColor: Colors.white,
              press: () async {
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
                  "cuentaEmail": widget.emailUser,
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
    opcionesCategoria.add("Ninguna");
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
