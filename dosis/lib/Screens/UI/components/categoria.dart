import 'package:dosis/Classes/categoria.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class CategoriaObj extends StatelessWidget {
  final Categoria categoria;
  final Function press;
  final int i;
  const CategoriaObj({
    Key key,
    this.categoria,
    this.press,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          /*
          Container(
            ////padding: EdgeInsets.all(0),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(),
            ),
          ),*/

          Container(
            alignment: Alignment.center,
            height: 110,
            child: Text(categorias[i].nombre +
                " \n \n" +
                "\t \t \t" +
                "\t \t \t" +
                "\t \t \t" +
                "\t \t \t" +
                "\t \t \t" +
                categorias[i].emoji),
            decoration: BoxDecoration(
                color: kgreyLColor, borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }
}
