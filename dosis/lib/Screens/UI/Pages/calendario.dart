import 'package:dosis/Classes/perfiles.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'calendario/perfil_appbar_constructor.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  bool _isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _perfiles(),
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
  }
} //class Calendario

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
