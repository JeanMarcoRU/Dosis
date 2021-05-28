import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/Screens/UI/components/addPerfil/pickAvatar/avatar_obj.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../add_screen.dart';

// ignore: must_be_immutable
class AvatarScreen extends StatelessWidget {
  //Perfil perfil;

  AvatarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 90.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/cuack.svg",
                        color: kgreyLColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Escoger avatar',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 50,
        ),
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: GridView.builder(
                itemCount: avatares.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) => AvatarObj(
                  i: index,
                  avatar: avatares[index],
                  //perfil: perfiles[index],
                  press: () => Navigator.pop(context),
                ),
              ),
            ),
            /*Column(
              children: <Widget>[
                SizedBox(
                  height: 520,
                ),
                Center(
                  child: RoundedButton(
                    text: "Guardar",
                    color: perfilAux[0].color,
                    textColor: Colors.white,
                    fontSize: 20,
                    paddingV: 3,
                    paddingH: 10,
                    ancho: 150,
                    largo: 50,
                    press: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddScreen(
                              perfil: perfilAux[0],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
