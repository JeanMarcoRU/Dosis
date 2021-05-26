import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'Medicamentos/formCategoria.dart';
import 'Medicamentos/formMedicamentos.dart';
import 'package:dosis/Screens/UI/components/categoria.dart';
import 'package:dosis/Screens/UI/components/Categorias/detailsCategoria/detailsCategoria.dart';

class Medicinas extends StatelessWidget {
  Medicinas({Key key}) : super(key: key);

  final List categoriaslist = [];
  final List medicamentosList = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final List catPrueb = [
    {
      "Nombre": "categoría prueba",
      "Emoji": ":/",
      "Descripcion": "categoría de prueb",
      "letralogo": "D"
    },
    {
      "Nombre": "Dolor de cabeza",
      "Emoji": ":(",
      "Descripción": "categoria para dolor",
      "letralogo": "Y"
    },
    {
      "Nombre": "tratamiento infantil",
      "Emoji": "😁",
      "Descripcion": "tratamiento infantil",
      "letralogo": "S"
    },
    {
      "Nombre": "yyabana",
      "Emoji": "😁",
      "Descripcion": "ghahaj",
      "letralogo": "S"
    }
  ];

  void cargarDatosCategoria(List c) {
    for (var i = 0; i < c.length; i++) {
      categorias.add(Categoria(
          letralogo: c[i]["letralogo"],
          nombre: c[i]["Nombre"],
          descripcion: c[i]["Descripcion"],
          emoji: c[i]["Emoji"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    //cargaCategoria();
    //print(categorias.length);
    cargarDatosCategoria(catPrueb);
    print(categorias);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Categorías",
                ),
                Tab(
                  text: "Todos los medicamentos",
                ),
              ],
            ),
            title: Text(
              'Medicamentos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            backgroundColor: kPrimaryColor,
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: categorias.length,
                itemBuilder: (context, index) => CategoriaObj(
                  i: index,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detailsCategoria(
                                categoria: categorias[index],
                              ))),
                ),
              ),
              BotonFlotante(),
            ],
          ),
        ),
      ),
    );
  }

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

  /* Funcion para cargar los datos de los medicamentos */
  void cargaMedicamentos() async {
    medicamentosList.clear();
    medicamentos.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Medicamento");

    QuerySnapshot medicamentosQS = await collectionReference.get();

    if (medicamentosQS.docs.length != 0) {
      for (var doc in medicamentosQS.docs) {
        medicamentosList.add(doc.data());
      }
    }
    medicamentos.clear();
    for (var i = 0; i < categoriaslist.length; i++) {
      medicamentos.add(Medicamento(
          letralogo: medicamentosList[i]["letralogo"],
          nombre: medicamentosList[i]["Nombre"],
          dosis: medicamentosList[i]["Dosis"],
          tomaDesde: medicamentosList[i]["Periodo de Toma Desde"],
          tomaHasta: medicamentosList[i]["Periodo de Toma Hasta"],
          dias: medicamentosList[i]["Dias"],
          hora: medicamentosList[i]["Hora"]));
    }
  }
} //  Fin clase medicamentos

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8.0),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return formMedicamento();
                    },
                  ),
                );
                // Respond to button press
              },
              icon: Icon(Icons.add),
              label: Text('Medicamento'),
              backgroundColor: kPrimaryColor,
            ),
            SizedBox(height: 8.0),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return formCategoria();
                    },
                  ),
                );
                // Respond to button press
              },
              icon: Icon(Icons.add),
              label: Text('Categoria'),
              backgroundColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
