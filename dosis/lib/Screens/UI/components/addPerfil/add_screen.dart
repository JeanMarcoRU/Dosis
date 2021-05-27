import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/Screens/UI/components/addPerfil/body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class AddScreen extends StatelessWidget {
  Perfil perfil;

  AddScreen({Key key, this.perfil}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //perfil1.avatar = "assets/avatares/grey.png";
    //perfil1.color = usergreyColor;
    //perfil1.nombre = "nombre";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(
        perfil: perfil,
      ),
    );
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
