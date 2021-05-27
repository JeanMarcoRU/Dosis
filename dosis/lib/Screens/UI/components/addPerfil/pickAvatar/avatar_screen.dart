import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class AvatarScreen extends StatelessWidget {
  Perfil perfil;

  AvatarScreen({Key key, this.perfil}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //perfil1.avatar = "assets/avatares/grey.png";
    //perfil1.color = usergreyColor;
    //perfil1.nombre = "nombre";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: null,
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
      title: Text(
        'Escoger avatar',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
