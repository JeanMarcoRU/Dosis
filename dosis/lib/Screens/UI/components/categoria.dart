import 'package:dosis/Classes/categoria.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';

class CategoriaObj extends StatefulWidget {
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
  _CategoriaObjState createState() => _CategoriaObjState(this.categoria);
}

class _CategoriaObjState extends State<CategoriaObj> {
  final Categoria categoria;

  _CategoriaObjState(this.categoria);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: 142,
              decoration: BoxDecoration(
                color: categoria.color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                    child: Text(
                      categoria.nombre,
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
                      categoria.descripcion,
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
                      categoria.letralogo,
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
                              categoria.emoji,
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
    );
  }
}

/*
alignment: Alignment.center,
              height: 120,
              child: Text(
                categorias[i].nombre +
                    " \n \n" +
                    "\t \t \t" +
                    "\t \t \t" +
                    "\t \t \t" +
                    "\t \t \t" +
                    "\t \t \t" +
                    categorias[i].emoji,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: userblueColor,
                borderRadius: BorderRadius.circular(15),
              ),
*/
