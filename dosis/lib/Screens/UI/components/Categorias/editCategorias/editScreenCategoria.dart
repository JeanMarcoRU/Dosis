import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';
import 'package:dosis/Screens/UI/components/Categorias/editCategorias/body.dart';

class EditScreenCategoria extends StatelessWidget {
  final Categoria categoria;

  const EditScreenCategoria({Key key, this.categoria}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(
        categoria: categoria,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      //title: "Agregar Medicamento",
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SocalIcon(
          iconSrc: "assets/icons/cuack.svg",
          color: kgreyLColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Información Categoría",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
