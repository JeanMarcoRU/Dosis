import 'package:dosis/Classes/medicamento.dart';
import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/UI/Pages/calendario/medicamento_constructor.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants.dart';
import 'calendario/mes_appbar_constructor.dart';
import 'calendario/perfil_appbar_constructor.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calendario(),
      theme: ThemeData(
        unselectedWidgetColor: Colors.white.withOpacity(0),
      ),
    );
  }
}

class calendario extends StatefulWidget {
  @override
  _calendarioState createState() => _calendarioState();
}

class _calendarioState extends State<calendario> {
  CalendarController _calendarController;
  bool valuefirst = false;
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
                width: 35,
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
                          Column(
                            //scrollDirection: Axis.vertical,
                            //shrinkWrap: true,
                            children: medicamentos.map((medicamento) {
                              return MedicamentoBox(
                                userColor: medicamento.color,
                                nombre: medicamento.nombre,
                                hora: medicamento.hora,
                                dosis: medicamento.dosis,
                              );
                            }).toList(),
                          ),
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
          bottom: BorderSide(width: 1.0, color: kgreyLColor),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: perfiles.map((perfil) {
          return PerfilAppbar(
            perfil: perfil,
            isPressed: true,
          );
        }).toList(),
      ),
    );
  }
}

/*
class Calendario extends StatefulWidget {
  const Calendario({Key key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  //bool _isPressed = true;
  List<String> meses = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
  ];
  List<int> dias = [1, 2, 3, 4, 5, 6, 7, 8, 9, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _perfiles(),
          _meses(),
        ],
      ),
    );
  }

  Widget _perfiles() {
    return Container(
      height: 90,
      width: double.infinity,
      margin: EdgeInsets.only(top: 45),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1.0, color: kgreyLColor),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: perfiles.map((perfil) {
          return PerfilAppbar(
            perfil: perfil,
            isPressed: true,
          );
        }).toList(),
      ),
    );
  }

  Widget _meses() {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: meses.map((mes) {
          return MesAppbar(
            mes: mes,
            isPressed: false,
          );
        }).toList(),
      ),
    );
  }

  /*
  Widget _crearPerfilesAppBar(Perfil perfil) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1,
                    color: perfil.color,
                  ),
                ),
                child: Center(
                  child: Text(
                    perfil.letralogo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _isPressed ? perfil.color : Colors.amber,
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
  }*/
} //class Calendario -----------------------------------------------------------
*/
//----------------------------------------------------------------------
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime(2020, 8, 3);
  DateTime _currentDate2 = DateTime(2020, 8, 4);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2020, 8, 3));
  DateTime _targetDateTime = DateTime(2020, 8, 3);

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.green, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 8, 5): [
        new Event(
          date: new DateTime(2020, 8, 5),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.green,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020, 8, 5),
          title: 'Event 2',
          icon: _eventIcon,
        ),
      ],
    },
  );
  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  @override
  void initState() {
    _markedDateMap.addAll(new DateTime(2020, 8, 13), [
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 3',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 8, 13),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),

      inactiveDaysTextStyle: TextStyle(
        color: Colors.pink,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarousel,
              ), // This trailing comma makes auto-formatting nicer for build methods.
              //custom icon without header
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
                    FlatButton(
                      child: Text('PREV'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    FlatButton(
                      child: Text('NEXT'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //
            ],
          ),
        ));
  }
}*/
