import 'package:dosis/Screens/Login/components/background.dart';
import 'package:dosis/Screens/Password/passwordScreen.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:dosis/components/text_field_container.dart';
import 'package:flutter/material.dart';
import '../../../authentication_service.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';

class Config extends StatelessWidget {
  Config({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 30.0, 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/cuack.svg",
                        //color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Configuraciones',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: Background(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Text(
                'Opciones de sonido',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              TextButton(
                child: Text(
                  'Cambiar Contraseña',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return passwordScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.01),
              TextButton(
                child: Text(
                  'Eliminar Cuenta',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {/* ... */},
              ),
              SizedBox(height: size.height * 0.01),
              RoundedButton(
                text: "Cerrar sesión",
                color: kPrimaryColor,
                textColor: Colors.white,
                press: () {
                  context.read<AuthenticationService>().signOut();
                },
              ),
              SizedBox(height: size.height * 0.00),
            ],
          ),
        ),
      ),
    );
  }
}
