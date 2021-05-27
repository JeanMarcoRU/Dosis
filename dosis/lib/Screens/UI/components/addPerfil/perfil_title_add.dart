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
              child: IconButton(
            icon: Image.asset(perfilAux[0].avatar),
            iconSize: 130,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AvatarScreen();
                  },
                ),
              );
            },
          )
              //child: Image.asset(perfil.avatar),
              ),

          //Expanded(child: Image.asset(perfil.avatar)),
          Center(
            child: Text(
              "cambiar avatar",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
