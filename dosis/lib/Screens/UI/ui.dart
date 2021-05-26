import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/UI/components/body.dart';

import '../../constants.dart';

// ignore: camel_case_types
class ui extends StatelessWidget {
  final List perfileslist = [];
  final List categoriaslist = [];
  final List categoriaIDs = [];
  @override
  Widget build(BuildContext context) {
    cargaPerfiles();
    cargaCategoria();
    return Scaffold(
      body: Body(),
    );
  }

  void cargaPerfiles() async {
    perfileslist.clear();
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
    perfiles.clear();
    for (var i = 0; i < perfileslist.length; i++) {
      perfiles.add(Perfil(
          letralogo: perfileslist[i]["letralogo"],
          avatar: perfileslist[i]["avatar"],
          nombre: perfileslist[i]["nombre"],
          apellido1: perfileslist[i]["apellido1"],
          apellido2: perfileslist[i]["apellido2"],
          numeroCedula: perfileslist[i]["cedula"],
          fechaNacimiento: DateTime.parse(
              perfileslist[i]["fechaNacimiento"].toDate().toString()),
          edad: perfileslist[i]["edad"],
          genero: perfileslist[i]["genero"],
          tipoSangre: perfileslist[i]["tipoSangre"],
          estadoCivil: perfileslist[i]["estadoCivil"],
          color: getColor(perfileslist[i]["color"])));
    }
  } //void

  /* Funcion para cargar los datos de Categoria */
  void cargaCategoria() async {
    categoriaslist.clear();
    categoriaIDs.clear();
    categorias.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Categoria");

    QuerySnapshot categoriaQS = await collectionReference.get();

    if (categoriaQS.docs.length != 0) {
      for (var doc in categoriaQS.docs) {
        //print(doc.id);
        categoriaIDs.add(doc.id);
        categoriaslist.add(doc.data());
      }
    }
    categorias.clear();
    for (var i = 0; i < categoriaslist.length; i++) {
      categorias.add(Categoria(
          idCategoria: categoriaIDs[i],
          letralogo: categoriaslist[i]["letralogo"],
          nombre: categoriaslist[i]["Nombre"],
          descripcion: categoriaslist[i]["Descripcion"],
          emoji: categoriaslist[i]["Emoji"]));
    }
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
  } //getcolor
}
