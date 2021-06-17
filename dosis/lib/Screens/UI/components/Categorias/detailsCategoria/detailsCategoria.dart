import 'package:dosis/Classes/categoria.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/Classes/medicamento.dart';
import 'components/body.dart';
import 'package:dosis/Screens/UI/components/Categorias/editCategorias/editScreenCategoria.dart';
import 'package:dosis/Screens/UI/components/Medicamentos/detailsMedicamentos/detailsMedicamentos.dart';

import 'package:dosis/Screens/UI/components/medicamento.dart';

class detailsCategoria extends StatelessWidget {
  final Categoria categoria;

  detailsCategoria({Key key, this.categoria}) : super(key: key);

  List medicamentosFiltro = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: kgreySLColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/cuack.svg",
                        //color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            categoria.nombre,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: RoundedButton(
                            text: "editar",
                            textColor: Colors.white,
                            //style: TextStyle(color: kPrimaryColor),
                            fontSize: 14,
                            color: kPrimaryColor,
                            paddingV: 3,
                            paddingH: 3,
                            ancho: 90,
                            largo: 30,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EditScreenCategoria(
                                      categoria: categoria,
                                    );
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
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: _medicamentos(),
    );
  }

  Widget _medicamentos() {
    filtrarMedicamentos();
    return ListView.builder(
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
    );
  }

  void filtrarMedicamentos() async {
    medicamentosFiltro.clear();

    for (var i = 0; i < medicamentos.length; i++) {
      if (categoria.nombre == medicamentos[i].categoriaP) {
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SocalIcon(
          iconSrc: "assets/icons/cuack.svg",
          color: kgreyLColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
