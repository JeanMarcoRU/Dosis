import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/Screens/UI/Pages/calendario.dart';
import 'package:dosis/Screens/UI/Pages/medicinas.dart';
import 'package:dosis/Screens/UI/Pages/perfiles.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

//void main() => runApp(MyApp());

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 1;

  List<Widget> _pages = [Perfiles(), Calendario(), Medicinas()];

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
          //type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: _currentPage == 0
                    ? SocalIcon(
                        iconSrc: "assets/icons/personUI.svg",
                        color: kPrimaryColor,
                      )
                    : SocalIcon(
                        iconSrc: "assets/icons/personUI.svg",
                      ),
                title: _currentPage == 0
                    ? Text(
                        "Perfiles",
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      )
                    : Text(
                        "",
                      )),
            BottomNavigationBarItem(
                icon: _currentPage == 1
                    ? SocalIcon(
                        iconSrc: "assets/icons/calendarUI.svg",
                        color: kPrimaryColor,
                      )
                    : SocalIcon(
                        iconSrc: "assets/icons/calendarUI.svg",
                      ),
                title: _currentPage == 1
                    ? Text(
                        "Horarios",
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      )
                    : Text(
                        "",
                      )),
            BottomNavigationBarItem(
                icon: _currentPage == 2
                    ? SocalIcon(
                        iconSrc: "assets/icons/pastillaDosis.svg",
                        color: kPrimaryColor,
                      )
                    : SocalIcon(
                        iconSrc: "assets/icons/pastillaDosis.svg",
                      ),
                title: _currentPage == 2
                    ? Text(
                        "Medicamentos",
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      )
                    : Text(
                        "",
                      )),
          ],
        ),
        body: _pages[_currentPage],
      ),
    );
  }
}
