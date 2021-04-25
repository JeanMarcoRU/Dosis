import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../ui.dart';

class Body extends StatelessWidget {
  final Perfil perfil;

  const Body({Key key, this.perfil}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                height: 500,
                decoration: BoxDecoration(
                    color: perfil.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      perfil.nombre,
                      style: TextStyle(
                        color: perfil.color,
                        fontSize: 40,
                      ),
                    ),
                    RoundedButton(
                      text: "Editar",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ui();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
