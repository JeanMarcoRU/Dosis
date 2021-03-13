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
                        iconSrc: "assets/icons/personui.svg",
                        //color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Usuarios',
                      style: TextStyle(
                        color: Colors.black,
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
          horizontal: 20,
          vertical: 50,
        ),
        child: Expanded(
          child: GridView.builder(
            itemCount: perfiles.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => PerfilObj(
              index: 0,
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
  final int index;
  const PerfilObj({
    Key key,
    this.perfil,
    this.press,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30),
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            color: perfiles[index].color,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              perfiles[index].letralogo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 75,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            perfiles[index].nombre,
            style: TextStyle(
              color: perfiles[index].color,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
