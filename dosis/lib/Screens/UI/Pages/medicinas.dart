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
import 'package:dosis/Screens/UI/components/Categorias/detailsCategoria/detailsCategoria.dart';

class Medicinas extends StatefulWidget {
  Medicinas({Key key}) : super(key: key);

  @override
  _MedicinasState createState() => _MedicinasState();
}

class _MedicinasState extends State<Medicinas> {
  final List categoriaslist = [];

  final List categoriasIDs = [];

  List medicamentosFiltro = [];

  List categoriasFiltro = [];

  final FirebaseFirestore db = FirebaseFirestore.instance;

  final List catPrueba = [
    {
      "Nombre": "tratamiento infantil",
      "Emoji": "😁",
      "Descripcion": "tratamiento infantil",
      "letralogo": "S"
    }
  ];

  //_MedicinasState();

  @override
  Widget build(BuildContext context) {
    //cargaCategoria();
    cargarDatosCategoria(catPrueba);
    categorias.removeLast();
    queryMedicamentos();
    queryCategoria();

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
                  child: _categorias(),
                ),
                //BotonFlotante(),
                _medicamentos(),
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

  Widget _medicamentos() {
    String emoji = "⚕️";
    queryMedicamentos();
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: medicamentosFiltro.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailsMedicamento(
              medicamento: medicamentosFiltro[index],
            ),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(15),
                  height: 80,
                  //width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: medicamentosFiltro[index].color,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              /*image: const DecorationImage(
                          image: NetworkImage(
                              'https://ichef.bbci.co.uk/news/640/cpsprodpb/1DD7/production/_102793670_1.jpg'),
                          fit: BoxFit.cover,
                        ),*/
                            ),
                            /*child: Icon(
                        Icons.beach_access,
                        color: Colors.blue,
                        size: 36.0,
                      ),*/
                            child: Center(
                              child: Text(
                                emoji,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        width: 200,
                        //color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              medicamentosFiltro[index].nombre,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              medicamentosFiltro[index].dosis,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              medicamentosFiltro[index].hora,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 45,
                        //semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categorias() {
    queryCategoria();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //mainAxisSpacing: 20,
        //crossAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      itemCount: categoriasFiltro.length,
      itemBuilder: (context, index) => GestureDetector(
        //int i = index,
        //categoria = categoriasFiltro[index],
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailsCategoria(
              categoria: categoriasFiltro[index],
            ),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Container(
                height: 120,
                width: 142,
                decoration: BoxDecoration(
                  color: categoriasFiltro[index].color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                      child: Text(
                        categoriasFiltro[index].nombre,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        categoriasFiltro[index].descripcion,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        categoriasFiltro[index].letralogo,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(
                            //padding: EdgeInsets.only(right: 10),
                            width: 95,
                            //height: 30,
                            //color: Colors.black,
                          ),
                          Container(
                            //padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                categoriasFiltro[index].emoji,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /*i: index,
        categoria: categoriasFiltro[index],
        press: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailsCategoria(
              categoria: categoriasFiltro[index],
            ),
          ),
        ),*/
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
          queryCategoria();
          queryMedicamentos();
          Perfil perfilAux;
          bool isPressed;
          perfilAux = perfil;
          isPressed = perfilAux.visibilidad;
          return GestureDetector(
            onTap: () {
              setState(() {
                isPressed = !isPressed;
                perfilAux.visibilidad = isPressed;
              });
            },
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.all(0),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: isPressed ? perfilAux.color : Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 1,
                          color: perfilAux.color,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          perfilAux.letralogo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isPressed ? Colors.white : perfilAux.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _topAppBar() {
    queryCategoria();
    queryMedicamentos();
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

  void queryCategoria() async {
    categoriasFiltro.clear();

    for (var i = 0; i < categorias.length; i++) {
      if (buscarPerfil(categorias[i].color)) {
        categoriasFiltro.add(Categoria(
            idCategoria: categorias[i].idCategoria,
            color: categorias[i].color,
            nombre: categorias[i].nombre,
            descripcion: categorias[i].descripcion,
            emoji: categorias[i].emoji,
            letralogo: categorias[i].letralogo));
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
}
