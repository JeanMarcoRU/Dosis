import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';

import 'package:dosis/Screens/UI/components/editPerfil/perfil_title_without_edit.dart';
import 'package:dosis/Screens/UI/ui.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Body extends StatelessWidget {
  final Perfil perfil;
  final TextEditingController nombreC = TextEditingController();
  final TextEditingController apellidosC = TextEditingController();
  final TextEditingController cedulaC = TextEditingController();
  final TextEditingController fechaNacC = TextEditingController();
  final TextEditingController edadC = TextEditingController();
  final TextEditingController generoC = TextEditingController();
  final TextEditingController tipoSangreC = TextEditingController();
  final TextEditingController estadoCivilC = TextEditingController();
  CollectionReference _perfil = FirebaseFirestore.instance.collection("Perfil");

  Body({Key key, this.perfil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.9;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                  top: 20,
                  left: 15,
                  right: 15,
                ),
                //height: 700,
                decoration: BoxDecoration(
                  color: perfil.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Datos Personales",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Nombre",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: nombreC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.nombre,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Apellidos",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: apellidosC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.apellidos,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Número de cédula",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: cedulaC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.numeroCedula,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Fecha de nacimiento",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: fechaNacC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.fechaNacimiento
                                  .toString()
                                  .substring(0, 10),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Edad",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: edadC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.edad.toString(),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Género",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: generoC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.genero,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Tipo de sangre",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: tipoSangreC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.tipoSangre,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Estado civil",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: estadoCivilC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: perfil.estadoCivil,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RoundedButton(
                            text: "Eliminar",
                            color: kgreyDColor,
                            textColor: Colors.white,
                            fontSize: 20,
                            paddingV: 3,
                            paddingH: 10,
                            ancho: 100,
                            largo: 50,
                            press: () async {
                              await _perfil.doc(perfil.idPerfil).delete();
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
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: RoundedButton(
                            text: "Guardar",
                            color: kPrimaryColor,
                            textColor: Colors.white,
                            fontSize: 20,
                            paddingV: 3,
                            paddingH: 10,
                            ancho: 100,
                            largo: 50,
                            press: () async {
                              if (nombreC.text.isNotEmpty) {
                                perfil.nombre = nombreC.text;
                              }
                              if (apellidosC.text.isNotEmpty) {
                                perfil.apellidos = apellidosC.text;
                              }
                              if (cedulaC.text.isNotEmpty) {
                                perfil.numeroCedula = cedulaC.text;
                              }
                              if (fechaNacC.text.isNotEmpty) {
                                perfil.fechaNacimiento =
                                    DateTime.parse(fechaNacC.text);
                              }
                              if (edadC.text.isNotEmpty) {
                                perfil.edad = int.parse(edadC.text);
                              }
                              if (generoC.text.isNotEmpty) {
                                perfil.genero = generoC.text;
                              }
                              if (tipoSangreC.text.isNotEmpty) {
                                perfil.tipoSangre = tipoSangreC.text;
                              }
                              if (estadoCivilC.text.isNotEmpty) {
                                perfil.estadoCivil = estadoCivilC.text;
                              }

                              await _perfil.doc(perfil.idPerfil).update({
                                "nombre": perfil.nombre,
                                "apellidos": perfil.apellidos,
                                "avatar": perfil.avatar,
                                "cedula": perfil.numeroCedula,
                                "color": getColor(perfil.color),
                                "edad": perfil.edad,
                                "estadoCivil": perfil.estadoCivil,
                                "fechaNacimiento": perfil.fechaNacimiento,
                                "genero": perfil.genero,
                                "letralogo": perfil.letralogo,
                                "tipoSangre": perfil.tipoSangre
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PerfilTittleWithoutEdit(perfil: perfil)
            ],
          ),
        )
      ],
    ));
  }

  String getColor(Color color) {
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
    } else {
      return "userblueColor";
    }
  } //getcolor
}
