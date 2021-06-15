import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/Screens/UI/components/Medicamentos/detailsMedicamentos/detailsMedicamentos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../constants.dart';
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

  final List medicamentosFiltro = [];

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

  void queryMedicamentos() async {
    medicamentosFiltro.clear();

    for (var i = 0; i < medicamentos.length; i++) {
      if (buscarPerfil(medicamentos[i].color)) {
        medicamentosFiltro.add(Medicamento(
            color: medicamentos[i].color,
            categoriaP: medicamentos[i].categoriaP,
            idMedicamento: medicamentos[i].idMedicamento,
            nombre: medicamentos[i].nombre,
            dosis: medicamentos[i].dosis,
            tomaDesde: medicamentos[i].tomaDesde,
            tomaHasta: medicamentos[i].tomaHasta,
            dias: medicamentos[i].dias,
            hora: medicamentos[i].hora));
      }
    }
  }

  //Busca el nombre perfil por color
  bool buscarPerfil(Color color) {
    bool resultado;
    for (var i = 0; i < perfiles.length; i++) {
      if (perfiles[i].color == color) {
        resultado = perfiles[i].visibilidad;
        break;
      }
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    //cargaCategoria();
    cargarDatosCategoria(catPrueba);
    categorias.removeLast();
    queryMedicamentos();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(190),
            child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: _topAppBar(),
              /*title: PreferredSize(
                preferredSize: Size.fromHeight(200.0),
                //child: _topAppBar(),
              ),*/
              bottom: new PreferredSize(
                preferredSize: new Size(MediaQuery.of(context).size.width, 26),
                child: Container(
                  height: 26,
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kPrimaryColor,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(0), // Creates border
                      color: kPrimaryColor,
                    ),
                    unselectedLabelStyle: TextStyle(
                      height: 1.5,
                      //backgroundColor: kmelroseColor,
                    ),
                    tabs: [
                      Tab(
                        //text: "categorías",
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.85) / 2,
                          child: Tab(
                            child: Center(
                              child: Text(
                                "categorías",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.85) / 2,
                          child: Tab(
                            child: Center(
                              child: Text(
                                "medicamentos",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: TabBarView(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  //const EdgeInsets.fromLTRB(30, 15.0, 90.0, 30),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //mainAxisSpacing: 20,
                      //crossAxisSpacing: 20,
                      childAspectRatio: 1.1,
                    ),
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
                ),
                //BotonFlotante(),
                ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: medicamentosFiltro.length,
                  itemBuilder: (context, index) => MedicamentoObj(
                    i: index,
                    medicamento: medicamentosFiltro[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detailsMedicamento(
                                  medicamento: medicamentosFiltro[index],
                                ))),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: SpeedDial(
            //elevation: 20,
            marginBottom: 20,
            child: Icon(
              Icons.add,
              size: 50,
            ),
            //animatedIcon: AnimatedIcons.menu_arrow,
            visible: true,
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.4,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            //elevation: 8.0,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SocalIcon(
                    iconSrc: "assets/icons/recetasDosis.svg",
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: kPrimaryColor,
                label: 'Categoría',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: kPrimaryColor,
                  background: Paint()
                    ..color = kmelroseColor
                    ..strokeWidth = 22.0
                    ..style = PaintingStyle.stroke
                    ..strokeJoin = StrokeJoin.round,
                ),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SocalIcon(
                    iconSrc: "assets/icons/pastillaDosis.svg",
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: kPrimaryColor,
                label: 'Medicamento',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: kPrimaryColor,
                  background: Paint()
                    ..color = kmelroseColor
                    ..strokeWidth = 22.0
                    ..style = PaintingStyle.stroke
                    ..strokeJoin = StrokeJoin.round,
                ),
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
          print("asi esta la visibilad");
          print(perfil.visibilidad);
          return PerfilAppbar(
            perfil: perfil,
            isPressed: perfil.visibilidad,
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
              SizedBox(width: 26),
              Text(
                'medicamentos',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
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
