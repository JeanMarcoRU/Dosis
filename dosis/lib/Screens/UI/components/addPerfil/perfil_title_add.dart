import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/UI/components/addPerfil/pickAvatar/avatar_screen.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilTittleAdd extends StatelessWidget {
  const PerfilTittleAdd({
    Key key,
    @required this.perfil,
  }) : super(key: key);

  final Perfil perfil;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(0),
              height: 129,
              width: 125,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: kPrimaryColor,
                  width: 1.5,
                ),
                //bord
              ),
              child: Center(
                child: IconButton(
                  icon: Image.asset(perfilAux[0].avatar),
                  iconSize: 130,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AvatarScreen()));
                  },
                ),
              ),
            ),
            //child: Image.asset(perfil.avatar), return AvatarScreen();
          ),

          //Expanded(child: Image.asset(perfil.avatar)),
        ],
      ),
    );
  }
}
