import 'package:dosis/Screens/UI/Pages/calendario.dart';
import 'package:dosis/Screens/UI/Pages/medicinas.dart';
import 'package:dosis/Screens/UI/Pages/perfil.dart';
import 'package:dosis/Screens/UI/Pages/recetas.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

//void main() => runApp(MyApp());

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 2;

  List<Widget> _pages = [Perfil(), Calendario(), Medicinas(), Recetas()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          currentIndex: _currentPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: kgreyDColor,
              ),
              title: Text(
                "Perfil",
                style: TextStyle(
                  color: kgreyDColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: kgreyDColor,
              ),
              title: Text(
                "Calendario",
                style: TextStyle(
                  color: kgreyDColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.circle,
                color: kgreyDColor,
              ),
              title: Text(
                "Medicinas",
                style: TextStyle(
                  color: kgreyDColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.table_chart,
                color: kgreyDColor,
              ),
              title: Text(
                "Recetas",
                style: TextStyle(
                  color: kgreyDColor,
                ),
              ),
            ),
          ],
        ),
        body: _pages[_currentPage],
      ),
    );
  }
}
