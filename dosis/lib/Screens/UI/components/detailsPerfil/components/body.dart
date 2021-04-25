import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../ui.dart';

class Body extends StatelessWidget {
  final Perfil perfil;

  const Body({Key key, this.perfil}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.9;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                height: 700,
                decoration: BoxDecoration(
                    color: perfil.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.asset(perfil.avatar),
                    ),

                    //Expanded(child: Image.asset(perfil.avatar)),
                    Center(
                      child: Text(
                        perfil.nombre,
                        style: TextStyle(
                          color: perfil.color,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Center(
                      child: RoundedButton(
                        text: "Editar",
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        fontSize: 20,
                        paddingV: 3,
                        paddingH: 10,
                        ancho: 100,
                        largo: 30,
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
                    ),
                    /*Row(
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(text: " \n"),
                          ],
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        //Expanded(child: Image.asset(perfil.avatar)),
                      ],
                    )*/
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
