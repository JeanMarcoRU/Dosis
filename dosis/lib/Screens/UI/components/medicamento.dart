import 'package:dosis/Classes/medicamento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedicamentoObj extends StatefulWidget {
  final Medicamento medicamento;
  final Function press;
  bool isPressed;
  final int i;
  String emoji;
  MedicamentoObj({
    Key key,
    this.medicamento,
    this.press,
    this.isPressed = false,
    this.i,
    this.emoji = "⚕️",
  }) : super(key: key);

  @override
  _MedicamentoObjState createState() => _MedicamentoObjState(this.medicamento);
}

class _MedicamentoObjState extends State<MedicamentoObj> {
  final Medicamento medicamento;

  _MedicamentoObjState(this.medicamento);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
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
                  color: medicamento.color,
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
                              widget.emoji,
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
                            medicamento.nombre,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            medicamento.dosis,
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            medicamento.hora,
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
    );
  }
}
