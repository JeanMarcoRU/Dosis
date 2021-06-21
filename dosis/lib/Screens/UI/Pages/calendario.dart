import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/UI/Pages/calendario/medicamento_constructor.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants.dart';
import 'calendario/mes_appbar_constructor.dart';
import 'calendario/perfil_appbar_constructor.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  List medicamentosFiltros = [];
  CollectionReference _medicamento =
      FirebaseFirestore.instance.collection("Historial");
  final List historial = [];

  void queryMedicamentos() async {
    medicamentosFiltros.clear();

    for (var i = 0; i < medicamentos.length; i++) {
      if (buscarPerfil(medicamentos[i].color)) {
        medicamentosFiltros.add(Medicamento(
            historialM: medicamentos[i].historialM,
            color: medicamentos[i].color,
            fueTomado: medicamentos[i].fueTomado,
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
    //queryMedicamentos();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calendario(this.medicamentosFiltros),
      theme: ThemeData(
        unselectedWidgetColor: Colors.white.withOpacity(0),
      ),
    );
  }
}

// ignore: camel_case_types
class calendario extends StatefulWidget {
  calendario(List medicamentosFiltros);

  @override
  _calendarioState createState() => _calendarioState();
}

// ignore: camel_case_types
class _calendarioState extends State<calendario> {
  CalendarController _calendarController;
  bool valuefirst = false;
  List medicamentosFiltros = [];
  Column muestraMediBoxes;
  var fechaSeleccionada = DateTime.now();
  var fechaFormat = DateFormat('MM/dd/yyyy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    queryMedicamentos();
    muestraMediBoxes = Column(
      children: medicamentosFiltros.map((medicamento) {
        int index = fechaSeleccionada.difference(medicamento.tomaDesde).inDays;
        return MedicamentoBox(
          medicamento: medicamento,
          userColor: medicamento.color,
          indiceDia: index,
          isPressed: medicamento.historialM[index],
          nombre: medicamento.nombre,
          hora: medicamento.hora,
          dosis: medicamento.dosis,
        );
      }).toList(),
    );
    return Scaffold(
      backgroundColor: Colors.white, //-------------------
      body: Column(
        children: <Widget>[
          _perfiles(),
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            initialSelectedDay: fechaSeleccionada,
            onDaySelected: (day, events, holidays) {
              setState(() {
                fechaSeleccionada = day;
              });
            },
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: kPrimaryColor, fontSize: 20),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
                size: 20,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: kPrimaryColor,
                size: 20,
              ),
              leftChevronMargin: EdgeInsets.only(left: 80),
              rightChevronMargin: EdgeInsets.only(right: 80),
            ),
            calendarStyle: CalendarStyle(
                weekendStyle: TextStyle(color: kmelroseColor),
                weekdayStyle: TextStyle(color: kmelroseColor)),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: kmelroseColor),
                weekdayStyle: TextStyle(color: kmelroseColor)),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 26,
              ),
              Container(
                child: Text(
                  'horario',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: kgreySLColor),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0,
                      ),
                      Column(
                        children: [
                          muestraMediBoxes,
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void updateIndex(List historial, int index) {
    historial[index] = !historial[index];
  }

  void queryMedicamentos() async {
    medicamentosFiltros.clear();

    for (var i = 0; i < medicamentos.length; i++) {
      if (buscarPerfil(medicamentos[i].color)) {
        if (medicamentos[i].tomaDesde.isBefore(fechaSeleccionada) &&
            !medicamentos[i].tomaHasta.isBefore(fechaSeleccionada)) {
          medicamentosFiltros.add(Medicamento(
              historialM: medicamentos[i].historialM,
              color: medicamentos[i].color,
              categoriaP: medicamentos[i].categoriaP,
              fueTomado: medicamentos[i].fueTomado,
              idMedicamento: medicamentos[i].idMedicamento,
              nombre: medicamentos[i].nombre,
              dosis: medicamentos[i].dosis,
              tomaDesde: medicamentos[i].tomaDesde,
              tomaHasta: medicamentos[i].tomaHasta,
              dias: medicamentos[i].dias,
              hora: medicamentos[i].hora));
        } else if (fechaFormat.format(medicamentos[i].tomaDesde) ==
            fechaFormat.format(fechaSeleccionada)) {
          medicamentosFiltros.add(Medicamento(
              historialM: medicamentos[i].historialM,
              color: medicamentos[i].color,
              categoriaP: medicamentos[i].categoriaP,
              fueTomado: medicamentos[i].fueTomado,
              idMedicamento: medicamentos[i].idMedicamento,
              nombre: medicamentos[i].nombre,
              dosis: medicamentos[i].dosis,
              tomaDesde: medicamentos[i].tomaDesde,
              tomaHasta: medicamentos[i].tomaHasta,
              dias: medicamentos[i].dias,
              hora: medicamentos[i].hora));
        } else if (fechaFormat.format(medicamentos[i].tomaHasta) ==
            fechaFormat.format(fechaSeleccionada)) {
          medicamentosFiltros.add(Medicamento(
              historialM: medicamentos[i].historialM,
              color: medicamentos[i].color,
              categoriaP: medicamentos[i].categoriaP,
              idMedicamento: medicamentos[i].idMedicamento,
              nombre: medicamentos[i].nombre,
              fueTomado: medicamentos[i].fueTomado,
              dosis: medicamentos[i].dosis,
              tomaDesde: medicamentos[i].tomaDesde,
              tomaHasta: medicamentos[i].tomaHasta,
              dias: medicamentos[i].dias,
              hora: medicamentos[i].hora));
        }
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

  Row dayMedicine(String time, String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 0, right: 20),
          width: 40 /*MediaQuery.of(context).size.width * 0.1*/,
          child: Text(
            time,
            style: TextStyle(
              color: kgreyDColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
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
              color: userblueColor,
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
                          "⚕️",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "1 pastilla",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: valuefirst ? kPrimaryColor : kmelroseColor,
                  ),
                  padding: EdgeInsets.only(right: 0),
                  child: Transform.scale(
                    scale: 2.0,
                    child: Checkbox(
                      activeColor: kPrimaryColor,
                      value: valuefirst,
                      onChanged: (bool value) {
                        setState(() {
                          valuefirst = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
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
}
