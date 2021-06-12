import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/UI/components/Medicamentos/detailsMedicamentos/detailsMedicamentos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../constants.dart';
import 'Medicamentos/formCategoria.dart';
import 'Medicamentos/formMedicamentos.dart';
import 'Medicamentos/FormularioM.dart';
import 'Medicamentos/FormularioC.dart';
import 'package:dosis/Screens/UI/components/categoria.dart';
import 'package:dosis/Screens/UI/components/medicamento.dart';
import 'package:dosis/Screens/UI/components/Categorias/detailsCategoria/detailsCategoria.dart';

import 'calendario/perfil_appbar_constructor.dart';

class Medicinas extends StatefulWidget {
  Medicinas({Key key}) : super(key: key);

  @override
  _MedicinasState createState() => _MedicinasState();
}

class _MedicinasState extends State<Medicinas> {
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

  @override
  Widget build(BuildContext context) {
    //cargaCategoria();
    cargarDatosCategoria(catPrueba);
    categorias.removeLast();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(210.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: _topAppBar(),
              /*title: PreferredSize(
                preferredSize: Size.fromHeight(200.0),
                //child: _topAppBar(),
              ),*/
              bottom: TabBar(
                isScrollable: true,
                labelColor: kPrimaryColor,
                tabs: [
                  Tab(
                    text: "Categorías",
                  ),
                  Tab(
                    text: "Medicamentos",
                  ),
                ],
              ),
              backgroundColor: Colors.white,
            ),
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
                padding: EdgeInsets.all(8.0),
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
                      return FormularioC();
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
                      return FormularioM();
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

  Widget _perfiles() {
    return Container(
      height: 85,
      width: double.infinity,
      margin: EdgeInsets.only(top: 45),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: kmelroseColor,
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: perfiles.map((perfil) {
          return PerfilAppbar(
            perfil: perfil,
            isPressed: true,
          );
        }).toList(),
      ),
    );
  }

  Widget _topAppBar() {
    return Container(
      child: Column(
        children: <Widget>[
          _perfiles(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Text(
                'medicamentos',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
}



  /*

return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white, //-------------------
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _perfiles(),
            Container(
              //color: Colors.pink,
              height: 80,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    //color: Colors.white,
                    width: 250,
                    child: Text(
                      'medicamentos',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ), // aqui va el icono de busqueda--------
                ],
              ),
            ),
            
          ],
        ),
      ),
    );


  
  */

 //  Fin clase medicamentos
