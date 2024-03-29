import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/Screens/UI/components/addPerfil/add_screen.dart';
import 'package:dosis/Screens/UI/components/detailsPerfil/details_screen.dart';
import 'package:dosis/Screens/UI/components/perfil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/UI/Pages/configurations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../constants.dart';

class Perfiles extends StatelessWidget {
  Perfiles({Key key}) : super(key: key);

  final String emailUser = FirebaseAuth.instance.currentUser.email;

  final List perfileslist = [];
  final List perfilesIDs = [];
  @override
  Widget build(BuildContext context) {
    perfilAux.clear();
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/refresh.svg",
                        //color: Colors.white,
                      ),
                      onPressed: () {
                        cargaPerfiles();
                        /*Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Perfiles()),
                        );*/
                      },
                    ),
                    Text(
                      'Perfiles',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/settings.svg",
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Config()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 50,
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: GridView.builder(
                itemCount: perfiles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //mainAxisSpacing: 20,
                  //crossAxisSpacing: 20,
                  childAspectRatio: 0.83,
                ),
                itemBuilder: (context, index) => PerfilObj(
                  i: index,
                  //perfil: perfiles[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                perfil: perfiles[index],
                              ))),
                ),
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
        backgroundColor: kjungleMistColor,
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddScreen(
                  perfil: perfilAux[0],
                );
              },
            ),
          );
        },
      ),
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
      if (perfileslist[i]["cuentaEmail"] == emailUser) {
        perfiles.add(Perfil(
            cuentaEmail: perfileslist[i]["cuentaEmail"],
            idPerfil: perfilesIDs[i],
            visibilidad: true, //POR DEFECTO
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
    }
  } //void//void

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
