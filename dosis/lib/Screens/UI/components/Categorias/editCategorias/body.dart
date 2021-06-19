import 'package:dosis/Classes/categoria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/backgroundWhite.dart';
import 'package:dosis/Screens/UI/ui.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/text_field_C.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class Body extends StatefulWidget {
  final Categoria categoria;

  Body({Key key, this.categoria}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController nombreController = TextEditingController();

  final TextEditingController descripcionController = TextEditingController();

  final TextEditingController emojiController = TextEditingController();

  final TextEditingController logoController = TextEditingController();

  String color_elegido;

  List<String> opColores = [];

  List<String> opPerfiles = [];

  CollectionReference _categoria =
      FirebaseFirestore.instance.collection("Categoria");

  @override
  Widget build(BuildContext context) {
    opcionesColores();
    elegirPerfiles();
    Size size = MediaQuery.of(context).size * 0.5;
    return BackgroundWhite(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.01),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Text(
                    buscarPerfil(widget.categoria.color),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      height: 0,
                      color: widget.categoria.color,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: color_elegido,
                    items:
                        opColores.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: buscarPerfil(getColor(value)),
                        child: Text(buscarPerfil(getColor(value)),
                            style: TextStyle(color: getColor(value))),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        color_elegido = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: nombreController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: widget.categoria.nombre,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            TextFieldC(
              child: TextField(
                controller: descripcionController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: widget.categoria.descripcion,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              //margin: EdgeInsets.all(30),
              height: 100,
              width: 100,
              child: Center(
                child: TextFieldC(
                  child: TextField(
                    controller: emojiController,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      labelText: widget.categoria.emoji,
                      labelStyle: TextStyle(
                        fontSize: 50,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Guardar",
              press: () async {
                if (nombreController.text.isNotEmpty) {
                  widget.categoria.nombre = nombreController.text;
                }
                if (descripcionController.text.isNotEmpty) {
                  widget.categoria.descripcion = descripcionController.text;
                }
                if (emojiController.text.isNotEmpty) {
                  widget.categoria.emoji = emojiController.text;
                }
                /*if (logoController.text.isNotEmpty) {
                  widget.categoria.letralogo = logoController.text;
                }*/
                if (buscarletralogo(color_elegido).isNotEmpty) {
                  widget.categoria.letralogo = buscarletralogo(color_elegido);
                  widget.categoria.color = buscarColorXnombre(color_elegido);
                }

                await _categoria.doc(widget.categoria.idCategoria).update({
                  "Color": getColorObj(widget.categoria.color),
                  "Nombre": widget.categoria.nombre,
                  "Descripcion": widget.categoria.descripcion,
                  "Emoji": widget.categoria.emoji,
                  "letralogo": widget.categoria.letralogo
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ui();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void opcionesColores() async {
    opColores.clear();
    for (var i = 0; i < perfiles.length; i++) {
      opColores.add(getColorString(perfiles[i].color));
    }
    print(opColores);
  }

  void elegirPerfiles() async {
    opPerfiles.clear();
    for (var i = 0; i < perfiles.length; i++) {
      opPerfiles.add(perfiles[i].nombre);
    }
    print(opPerfiles);
  }

  String buscarPerfil(Color color) {
    String resultado = "";
    for (var i = 0; i < perfiles.length; i++) {
      if (perfiles[i].color == color) {
        resultado = perfiles[i].nombre;
        break;
      }
    }
    return resultado;
  }

  String buscarletralogo(String nombre) {
    String resultado = "";
    for (var i = 0; i < perfiles.length; i++) {
      if (perfiles[i].nombre == nombre) {
        resultado = perfiles[i].letralogo;
        break;
      }
    }
    return resultado;
  }

  Color buscarColorXnombre(String nombre) {
    Color resultado = userblueColor;
    for (var i = 0; i < perfiles.length; i++) {
      if (perfiles[i].nombre == nombre) {
        resultado = perfiles[i].color;
        break;
      }
    }
    return resultado;
  }

  String getColorString(Color color) {
    if (color == userpinkColor) {
      return "Rosado";
    }
    if (color == userblueColor) {
      return "Azul";
    }
    if (color == userpurpleColor) {
      return "Morado";
    }
    if (color == usergreenColor) {
      return "Verde";
    }
    if (color == usergreyColor) {
      return "Gris";
    }
    if (color == userorangeColor) {
      return "Anaranjado";
    }
  }

  Color getColor(String color) {
    switch (color) {
      case "Rosado":
        {
          return userpinkColor;
        }
        break;

      case "Azul":
        {
          return userblueColor;
        }
        break;

      case "Morado":
        {
          return userpurpleColor;
        }
        break;

      case "Verde":
        {
          return usergreenColor;
        }
        break;

      case "Anaranjado":
        {
          return userorangeColor;
        }
        break;

      case "Gris":
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
  }

  String getColorObj(Color color) {
    if (color == userpinkColor) {
      return "userpinkColor";
    } else if (color == userblueColor) {
      return "userblueColor";
    } else if (color == userpurpleColor) {
      return "userpurpleColor";
    } else if (color == usergreenColor) {
      return "usergreenColor";
    } else if (color == userorangeColor) {
      return "userorangeColor";
    } else if (color == usergreyColor) {
      return "usergreyColor";
    } else {
      return "userblueColor";
    }
  }

  Color buscarColor(String perfil) {
    Color resultado;
    for (var i = 0; i < perfiles.length; i++) {
      if (perfiles[i].nombre == perfil) {
        resultado = perfiles[i].color;
        break;
      }
    }
    return resultado;
  }
}



/*Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                //height: 700,
                decoration: BoxDecoration(
                  color: Colors.white10,
                ),
                child: Column(
                  children: <Widget>[
                    TextFieldC(
                      child: TextField(
                        controller: nombreController,
                        style: TextStyle(
                          fontSize: 14.0,
                          height: 0,
                          color: kgreyDColor,
                        ),
                        decoration: InputDecoration(
                          hintText: categoria.nombre,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: descripcionController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: categoria.descripcion,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: emojiController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: categoria.emoji,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: logoController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: categoria.letralogo,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RoundedButton(
                            text: "eliminar",
                            color: kgreyDColor,
                            textColor: Colors.white,
                            fontSize: 18,
                            paddingV: 3,
                            paddingH: 10,
                            ancho: 100,
                            largo: 50,
                            press: () async {
                              print(categoria.idCategoria);
                              await _categoria
                                  .doc(categoria.idCategoria)
                                  .delete();
                              print("eliminado");
                              print(categoria.idCategoria);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ui();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: RoundedButton(
                            text: "guardar",
                            color: kPrimaryColor,
                            textColor: Colors.white,
                            fontSize: 20,
                            paddingV: 3,
                            paddingH: 10,
                            ancho: 100,
                            largo: 50,
                            press: () async {
                              if (nombreController.text.isNotEmpty) {
                                categoria.nombre = nombreController.text;
                              }
                              if (descripcionController.text.isNotEmpty) {
                                categoria.descripcion =
                                    descripcionController.text;
                              }
                              if (emojiController.text.isNotEmpty) {
                                categoria.emoji = emojiController.text;
                              }
                              if (logoController.text.isNotEmpty) {
                                categoria.letralogo = logoController.text;
                              }

                              await _categoria
                                  .doc(categoria.idCategoria)
                                  .update({
                                "Nombre": categoria.nombre,
                                "Descripcion": categoria.descripcion,
                                "Emoji": categoria.emoji,
                                "letralogo": categoria.letralogo,
                                "Color": getColor(categoria.color)
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ui();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    /*
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                        ),
                        Center(
                          child: RoundedButton(
                            text: "Guardar",
                            color: kPrimaryColor,
                            textColor: Colors.white,
                            fontSize: 20,
                            paddingV: 3,
                            paddingH: 10,
                            ancho: 100,
                            largo: 50,
                            press: () async {
                              if (nombreController.text.isNotEmpty) {
                                categoria.nombre = nombreController.text;
                              }
                              if (descripcionController.text.isNotEmpty) {
                                categoria.descripcion =
                                    descripcionController.text;
                              }
                              if (emojiController.text.isNotEmpty) {
                                categoria.emoji = emojiController.text;
                              }
                              if (logoController.text.isNotEmpty) {
                                categoria.letralogo = logoController.text;
                              }
                              await _categoria
                                  .doc(categoria.idCategoria)
                                  .update({
                                "Nombre": categoria.nombre,
                                "Descripcion": categoria.descripcion,
                                "Emoji": categoria.emoji,
                                "letralogo": categoria.letralogo
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ui();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );*/
