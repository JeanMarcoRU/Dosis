import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'Medicamentos/formCategoria.dart';
import 'Medicamentos/formMedicamentos.dart';

class Medicinas extends StatelessWidget {
  Medicinas({Key key}) : super(key: key);

  static const String _title = 'Medicamentos';
  final List categoriaslist = [];
  final List medicamentosList = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: PestanasMedicamentos(),
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
          descripcion: categoriaslist[i]["Descripción"],
          emoji: categoriaslist[i]["Emoji"]));
    }
    print(categorias);
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
    print(medicamentos);
  }

  //Funcion para leer una categoria
  void leerCategoria(String idCategoria) async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await db.collection("Categoria").doc(idCategoria).get();
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  //Funcion para eliminar una categoria
  void eliminarCategoria(String idCategoria) async {
    try {
      db.collection("Categoria").doc(idCategoria).delete();
    } catch (e) {
      print(e);
    }
  }

  //Funcion para actualizar una categoria
  void updateCategoria(String idCategoria, data) async {
    try {
      db.collection("Categoria").doc(idCategoria).update(data);
    } catch (e) {
      print(e);
    }
  }

  //Funcion para leer un medicamento
  void leerMedicamento(String idMedicamento) async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await db.collection("Medicamento").doc(idMedicamento).get();
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  //Funcion para eliminar un medicamento
  void eliminarMedicamento(String idMedicamento) async {
    try {
      db.collection("Medicamento").doc(idMedicamento).delete();
    } catch (e) {
      print(e);
    }
  }

  //Funcion para actualizar un medicamento
  void updateMedicamento(String idMedicamento, data) async {
    try {
      db.collection("Medicamento").doc(idMedicamento).update(data);
    } catch (e) {
      print(e);
    }
  }
} //  Fin clase medicamentos

class PestanasMedicamentos extends StatelessWidget {
  const PestanasMedicamentos({Key key}) : super(key: key);
  //Solo para probar
  static List categoriasPrueb = [
    ["Y", "Yanina", "2 x s", "XD"],
    ["S", "Sebas", "7 x s", "XD"],
    ["P", "Prueba", "4 x s", ":("]
  ];
  static List categoriaslist = Medicinas().categoriaslist;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Categorías',
                ),
                Tab(
                  text: 'Todos los medicamentos',
                ),
              ],
            ),
            title: Text('Medicamentos'),
          ),
          body: TabBarView(
            children: [
              _buildGrid(),
              BotonFlotante(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 250,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: _buildGridTileList(categoriaslist.length));

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
            child: Text('${categoriaslist[i][1]}'),
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
          )); //Solo para probar

} // Fin pestanaMedicinas

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
