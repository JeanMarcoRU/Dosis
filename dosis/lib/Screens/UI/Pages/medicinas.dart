import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Screens/UI/components/Medicamentos/detailsMedicamentos/detailsMedicamentos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../constants.dart';
import 'Medicamentos/formCategoria.dart';
import 'Medicamentos/formMedicamentos.dart';
import 'package:dosis/Screens/UI/components/categoria.dart';
import 'package:dosis/Screens/UI/components/medicamento.dart';
import 'package:dosis/Screens/UI/components/Categorias/detailsCategoria/detailsCategoria.dart';

class Medicinas extends StatelessWidget {
  Medicinas({Key key}) : super(key: key);

  final List categoriaslist = [];
  final List categoriasIDs = [];
  final List medicamentosList = [];
  final List medicamentosIDs = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final List catPrueba = [
    {
      "Nombre": "tratamiento infantil",
      "Emoji": "😁",
      "Descripcion": "tratamiento infantil",
      "letralogo": "S"
    }
  ];
  final List medPrueba = [
    {
      "Nombre": "tratamiento infantil",
      "Dosis": "1 vez por semana",
      "Días": "L, V, D",
      "Periodo de Toma Desde": "L",
      "Periodo de Toma Hasta": "J",
      "Hora": "8:00 p.m"
    }
  ];
  void cargarDatosCategoria(List c) {
    for (var i = 0; i < c.length; i++) {
      categorias.add(Categoria(
          idCategoria: "0",
          letralogo: c[i]["letralogo"],
          nombre: c[i]["Nombre"],
          descripcion: c[i]["Descripcion"],
          emoji: c[i]["Emoji"]));
    }
  }

  void cargaDatosMedicamentos(List m) {
    for (var i = 0; i < m.length; i++) {
      medicamentos.add(Medicamento(
          idMedicamento: "0",
          nombre: m[i]["Nombre"],
          dosis: m[i]["Dosis"],
          tomaDesde: m[i]["Periodo de Toma Desde"],
          tomaHasta: m[i]["Periodo de Toma Hasta"],
          dias: m[i]["Dias"],
          hora: m[i]["Hora"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    //cargaCategoria();
    cargarDatosCategoria(catPrueba);
    categorias.removeLast();
    cargaDatosMedicamentos(medPrueba);
    //medicamentos.removeLast();
    //print(medicamentos);
    print(medicamentos.length);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              labelColor: kPrimaryColor,
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
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.white,
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
              //BotonFlotante(),
              ListView.builder(
                itemCount: medicamentos.length,
                itemBuilder: (context, index) => MedicamentoObj(
                  i: index,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detailsMedicamento(
                                medicamento: medicamentos[index],
                              ))),
                ),
              ),
            ],
          ),
          floatingActionButton: SpeedDial(
            marginBottom: 20,
            animatedIcon: AnimatedIcons.add_event,
            visible: true,
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                child: Icon(Icons.add),
                backgroundColor: kPrimaryColor,
                label: 'Categoría',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return formCategoria();
                    },
                  ),
                ),
              ),
              SpeedDialChild(
                child: Icon(Icons.add),
                backgroundColor: kPrimaryColor,
                label: 'Medicamento',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return formMedicamento();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Funcion para cargar los datos de Categoria */
  void cargaCategoria() async {
    categoriaslist.clear();
    categoriasIDs.clear();
    categorias.clear();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Categoria");

    QuerySnapshot categoriaQS = await collectionReference.get();

    if (categoriaQS.docs.length != 0) {
      for (var doc in categoriaQS.docs) {
        categoriasIDs.add(doc.id);
        categoriaslist.add(doc.data());
      }
    }
    categorias.clear();
    for (var i = 0; i < categoriaslist.length; i++) {
      categorias.add(Categoria(
          idCategoria: categoriasIDs[i],
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
    medicamentos.clear();
    for (var i = 0; i < categoriaslist.length; i++) {
      medicamentos.add(Medicamento(
          idMedicamento: medicamentosIDs[i],
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
