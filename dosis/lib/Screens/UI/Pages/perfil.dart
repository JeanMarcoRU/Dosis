import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/personUI.svg",
                        //color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Perfiles',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/settings.svg",
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 100,
        ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: GridView.builder(
              itemCount: perfiles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //mainAxisSpacing: 20,
                //crossAxisSpacing: 20,
                childAspectRatio: 0.83,
              ),
              itemBuilder: (context, index) => PerfilObj(
                i: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PerfilObj extends StatelessWidget {
  final Perfil perfil;
  final Function press;
  final int i;
  const PerfilObj({
    Key key,
    this.perfil,
    this.press,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: perfiles[i].color,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              perfiles[i].letralogo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            perfiles[i].nombre,
            style: TextStyle(
              color: perfiles[i].color,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
