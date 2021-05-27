import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/UI/components/addPerfil/perfil_title_add.dart';
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

  Body({
    Key key,
    this.perfil,
  }) : super(key: key);

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
                  color: kjungleMistColor,
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
                              //hintText: perfil.nombre,
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
                              //hintText: perfil.apellidos,
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
                              hintText: "x-xxxx-xxxx", //perfil.numeroCedula,
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
                              hintText: "aaaa-mm-dd",
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
                              //hintText: perfil.edad.toString(),
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
                              //hintText: perfil.genero,
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
                              //hintText: perfil.tipoSangre,
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
                              //hintText: perfil.estadoCivil,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: RoundedButton(
                        text: "Guardar",
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        fontSize: 20,
                        paddingV: 3,
                        paddingH: 10,
                        ancho: 150,
                        largo: 50,
                        press: () async {
                          perfilAux[0].nombre = nombreC.text;
                          perfilAux[0].apellidos = apellidosC.text;
                          perfilAux[0].numeroCedula = cedulaC.text;
                          perfilAux[0].fechaNacimiento =
                              DateTime.parse(fechaNacC.text);
                          perfilAux[0].edad = int.parse(edadC.text);
                          perfilAux[0].genero = generoC.text;
                          perfilAux[0].tipoSangre = tipoSangreC.text;
                          perfilAux[0].estadoCivil = estadoCivilC.text;

                          await _perfil.add({
                            "nombre": perfil.nombre,
                            "apellidos": perfilAux[0].apellidos,
                            "avatar": perfilAux[0].avatar,
                            "cedula": perfilAux[0].numeroCedula,
                            "color": getColor(perfilAux[0].color),
                            "edad": perfilAux[0].edad,
                            "estadoCivil": perfilAux[0].estadoCivil,
                            "fechaNacimiento": perfilAux[0].fechaNacimiento,
                            "genero": perfilAux[0].genero,
                            "letralogo": perfilAux[0]
                                .nombre
                                .substring(0, 1)
                                .toUpperCase(),
                            "tipoSangre": perfilAux[0].tipoSangre
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
              ),
              PerfilTittleAdd(perfil: perfil)
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
    } else if (color == usergreyColor) {
      return "usergreyColor";
    } else {
      return "userblueColor";
    }
  } //getcolor
}
