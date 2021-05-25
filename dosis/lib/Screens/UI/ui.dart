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
          fechaNacimiento: "hay que pasarlo a fecha",
          edad: perfileslist[i]["edad"],
          color: getColor(perfileslist[i]["color"])));
    }
  } //void

  /* Funcion para cargar los datos de Categoria */
  void cargaCategoria() async {
    categoriaslist.clear();
    categorias.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Categoria");

    QuerySnapshot categoriaQS = await collectionReference.get();

    if (categoriaQS.docs.length != 0) {
      for (var doc in categoriaQS.docs) {
        categoriaslist.add(doc.data());
      }
    }
    categorias.clear();
    for (var i = 0; i < categoriaslist.length; i++) {
      categorias.add(Categoria(
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
