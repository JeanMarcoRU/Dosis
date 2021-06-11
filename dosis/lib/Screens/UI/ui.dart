import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/UI/components/body.dart';

import '../../constants.dart';

// ignore: camel_case_types
class ui extends StatelessWidget {
  final List perfileslist = [];
  final List perfilesIDs = [];
  final List categoriaslist = [];
  final List categoriaIDs = [];
  final List medicamentosList = [];
  final List medicamentosIDs = [];
  @override
  Widget build(BuildContext context) {
    perfilAux.clear();
    avatares = [
      "assets/avatares/blue.png",
      "assets/avatares/green.png",
      "assets/avatares/grey.png",
      "assets/avatares/orange.png",
      "assets/avatares/pink.png",
      "assets/avatares/purple.png"
    ];
    perfilAux.add(Perfil(
        idPerfil: "",
        letralogo: "X",
        avatar: "assets/avatares/grey.png",
        nombre: "nombre",
        apellidos: "",
        numeroCedula: "",
        fechaNacimiento: DateTime.parse('1900-01-01'),
        edad: 0,
        genero: "",
        tipoSangre: "",
        estadoCivil: "",
        color: usergreyColor));
    cargaPerfiles();
    cargaCategoria();
    cargaMedicamentos();
    return Scaffold(
      body: Body(),
    );
  }

  void cargaPerfiles() async {
    perfileslist.clear();
    perfilesIDs.clear();
    perfiles.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Perfil");

    QuerySnapshot perfilesQS = await collectionReference.get();

    if (perfilesQS.docs.length != 0) {
      for (var doc in perfilesQS.docs) {
        //print(doc.data());
        perfilesIDs.add(doc.id);
        perfileslist.add(doc.data());
      }
    }
    perfiles.clear();
    for (var i = 0; i < perfileslist.length; i++) {
      perfiles.add(Perfil(
          idPerfil: perfilesIDs[i],
          letralogo: perfileslist[i]["letralogo"],
          avatar: perfileslist[i]["avatar"],
          nombre: perfileslist[i]["nombre"],
          apellidos: perfileslist[i]["apellidos"],
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

  /* Funcion para cargar los datos de los medicamentos */
  void cargaMedicamentos() async {
    medicamentosList.clear();
    medicamentos.clear();
    medicamentosIDs.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Medicamentos");

    QuerySnapshot medicamentosQS = await collectionReference.get();

    if (medicamentosQS.docs.length != 0) {
      for (var doc in medicamentosQS.docs) {
        medicamentosIDs.add(doc.id);
        medicamentosList.add(doc.data());
      }
    }
    print(medicamentosIDs);
    medicamentos.clear();
    for (var i = 0; i < medicamentosList.length; i++) {
      medicamentos.add(Medicamento(
          color: getColor(medicamentosList[i]["Color"]),
          idMedicamento: medicamentosIDs[i],
          nombre: medicamentosList[i]["Nombre"],
          dosis: medicamentosList[i]["Dosis"],
          tomaDesde: medicamentosList[i]["Período de Toma Desde"],
          tomaHasta: medicamentosList[i]["Período de Toma Hasta"],
          dias: medicamentosList[i]["Días"],
          hora: medicamentosList[i]["Hora"]));
    } // for

    medicamentos.sort((Medicamento a, Medicamento b) =>
        a.hora.compareTo(b.hora)); //los ordena por hora
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

      case "usergreyColor":
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
  } //getcolor
}
