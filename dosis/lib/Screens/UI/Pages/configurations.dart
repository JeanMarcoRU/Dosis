import 'package:dosis/Screens/Login/components/background.dart';
import 'package:dosis/Screens/Password/passwordScreen.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/components/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../../authentication_service.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class Config extends StatelessWidget {
  Config({Key key}) : super(key: key);

  bool notificar = true;
  bool sonido = true;
  bool vibrar = true;

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
            children: <Widget>[
              Divider(
                color: kgreyLColor,
              ),
              SwitchNotificaciones(),
              Divider(
                color: kgreyLColor,
              ),
              SwitchSonido(),
              SwitchVibracion(),
              Divider(
                color: kgreyLColor,
              ),
              SizedBox(height: size.height * 0.05),
              TextButton(
                child: Text(
                  'Cambiar Contraseña',
                  textDirection: TextDirection.rtl,
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
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  context.read<AuthenticationService>().deleteUser();
                },
              ),
              SizedBox(height: size.height * 0.01),
              TextButton(
                child: Text(
                  'Términos de Uso',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  /* pendiente */
                },
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

/* Permitir Notificaciones */
class SwitchNotificaciones extends StatefulWidget {
  @override
  _SwitchNotificacionesState createState() => _SwitchNotificacionesState();
}

class _SwitchNotificacionesState extends State<SwitchNotificaciones> {
  var _notificar = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MergeSemantics(
        child: ListTile(
          title: Text(
            'Permitir notificaciones',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          trailing: CupertinoSwitch(
            value: _notificar,
            activeColor: kPrimaryColor,
            onChanged: (bool value) {
              setState(() {
                _notificar = value;
              });
            },
          ),
          onTap: () {
            setState(() {
              _notificar = !_notificar;
            });
          },
        ),
      ),
    );
  }
}

/* Permitir sonido */
class SwitchSonido extends StatefulWidget {
  @override
  _SwitchSonidoState createState() => _SwitchSonidoState();
}

class _SwitchSonidoState extends State<SwitchSonido> {
  var _sonido = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MergeSemantics(
        child: ListTile(
          title: Text(
            'Sonidos',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          trailing: CupertinoSwitch(
            value: _sonido,
            activeColor: kPrimaryColor,
            onChanged: (bool value) {
              setState(() {
                _sonido = value;
              });
            },
          ),
          onTap: () {
            setState(() {
              _sonido = !_sonido;
            });
          },
        ),
      ),
    );
  }
}

/* Permitir sonido */
class SwitchVibracion extends StatefulWidget {
  @override
  _SwitchVibracionState createState() => _SwitchVibracionState();
}

class _SwitchVibracionState extends State<SwitchVibracion> {
  var _vibrar = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MergeSemantics(
        child: ListTile(
          title: Text(
            'Vibración',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          trailing: CupertinoSwitch(
            value: _vibrar,
            activeColor: kPrimaryColor,
            onChanged: (bool value) {
              setState(() {
                _vibrar = value;
              });
            },
          ),
          onTap: () {
            setState(() {
              _vibrar = !_vibrar;
            });
          },
        ),
      ),
    );
  }
}
