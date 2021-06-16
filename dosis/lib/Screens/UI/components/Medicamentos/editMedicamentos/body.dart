import 'package:dosis/Classes/medicamento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Screens/UI/ui.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dosis/constants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Body extends StatelessWidget {
  final Medicamento medicamento;
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController dosisController = TextEditingController();
  final TextEditingController tomaDesdeController = TextEditingController();
  final TextEditingController tomaHastaController = TextEditingController();
  final TextEditingController diasController = TextEditingController();
  final TextEditingController horaController = TextEditingController();
  final TextEditingController categoriaC = TextEditingController();
  CollectionReference _medicamento =
      FirebaseFirestore.instance.collection("Medicamentos");

  static List<String> diasS = ["lun", "mar", "mie", "jue", "vie", "sáb", "dom"];
  final _items = diasS.map((e) => MultiSelectItem<String>(e, e)).toList();
  List<String> _selecteds = [];

  Body({Key key, this.medicamento}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.9;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                //height: 700,
                decoration: BoxDecoration(
                  color: Colors.white10,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Información de Medicamentos",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
                          child: Text(
                            "Nombre",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                            controller: nombreController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: medicamento.nombre,
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
                          child: Text(
                            "Dosis",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                            controller: dosisController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: medicamento.dosis,
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
                          child: Text(
                            "Período de toma desde",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                            controller: tomaDesdeController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: medicamento.tomaDesde
                                  .toString()
                                  .substring(0, 10),
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
                          child: Text(
                            "Período de toma hasta",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                            controller: tomaHastaController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: medicamento.tomaHasta
                                  .toString()
                                  .substring(0, 10),
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
                          child: Text(
                            "Días",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                        ),
                      ],
                    ),
                    MultiSelectChipField<String>(
                      items: _items,
                      chipColor: userblueColor,
                      textStyle: TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0)),
                      headerColor: Colors.white,
                      initialValue: getDias(medicamento.dias),
                      showHeader: false,
                      selectedChipColor: kPrimaryColor,
                      selectedTextStyle: TextStyle(color: Colors.white),
                      onTap: (values) {
                        _selecteds = values;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Hora",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                            controller: horaController,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: medicamento.hora,
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
                          child: Text(
                            "Categoria",
                            style: TextStyle(
                              color: kgreyDColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                            controller: categoriaC,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 0,
                              color: kgreyDColor,
                            ),
                            decoration: InputDecoration(
                              hintText: medicamento.categoriaP,
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
                                medicamento.nombre = nombreController.text;
                              }
                              if (dosisController.text.isNotEmpty) {
                                medicamento.dosis = dosisController.text;
                              }
                              if (tomaDesdeController.text.isNotEmpty) {
                                medicamento.tomaDesde =
                                    DateTime.parse(tomaDesdeController.text);
                              }
                              if (tomaHastaController.text.isNotEmpty) {
                                medicamento.tomaHasta =
                                    DateTime.parse(tomaHastaController.text);
                              }
                              if (_selecteds.isNotEmpty) {
                                medicamento.dias = filtrarDias(_selecteds);
                              }
                              if (horaController.text.isNotEmpty) {
                                medicamento.hora = horaController.text;
                              }
                              await _medicamento
                                  .doc(medicamento.idMedicamento)
                                  .update({
                                "Nombre": medicamento.nombre,
                                "Dosis": medicamento.dosis,
                                "Período de Toma Desde": medicamento.tomaDesde,
                                "Período de Toma Hasta": medicamento.tomaHasta,
                                "Días": medicamento.dias,
                                "Hora": medicamento.hora,
                                "CategoriaP": medicamento.categoriaP
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
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  //Funciones
  List<dynamic> filtrarDias(List<String> dias) {
    List resultado = [false, false, false, false, false, false, false];
    for (var i = 0; i < dias.length; i++) {
      if (dias[i] == "lun") {
        resultado[0] = true;
      }
      if (dias[i] == "mar") {
        resultado[1] = true;
      }
      if (dias[i] == "mie") {
        resultado[2] = true;
      }
      if (dias[i] == "jue") {
        resultado[3] = true;
      }
      if (dias[i] == "vie") {
        resultado[4] = true;
      }
      if (dias[i] == "sáb") {
        resultado[5] = true;
      }
      if (dias[i] == "dom") {
        resultado[6] = true;
      }
    }
    return resultado;
  }

  List<String> getDias(List<dynamic> dias) {
    List<String> resultado = [];
    if (dias[0]) {
      resultado.add("lun");
    }
    if (dias[1]) {
      resultado.add("mar");
    }
    if (dias[2]) {
      resultado.add("mie");
    }
    if (dias[3]) {
      resultado.add("jue");
    }
    if (dias[4]) {
      resultado.add("vie");
    }
    if (dias[5]) {
      resultado.add("sáb");
    }
    if (dias[6]) {
      resultado.add("dom");
    }
    return resultado;
  }
}
