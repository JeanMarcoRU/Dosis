import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/UI/components/addPerfil/pickAvatar/avatar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../add_screen.dart';

class AvatarObj extends StatelessWidget {
  final String avatar;
  final Function press;
  final int i;
  const AvatarObj({
    Key key,
    this.avatar,
    this.press,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Container(
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
                icon: Image.asset(avatar),
                iconSize: 130,
                onPressed: () {
                  perfilAux[0].avatar = avatar;
                  perfilAux[0].color = getColor(i);
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
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AvatarScreen()));*/
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(int index) {
    if (index == 0) {
      return userblueColor;
    } else if (index == 1) {
      return usergreenColor;
    } else if (index == 2) {
      return usergreyColor;
    } else if (index == 3) {
      return userorangeColor;
    } else if (index == 4) {
      return userpinkColor;
    } else if (index == 5) {
      return userpurpleColor;
    } else {
      return userblueColor;
    }
  }
}
