import 'package:dosis/Classes/perfiles.dart';
import 'package:dosis/Screens/Signup/components/social_icon.dart';
import 'package:dosis/Screens/UI/components/detailsPerfil/details_screen.dart';
import 'package:dosis/Screens/UI/components/perfil.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Perfiles extends StatelessWidget {
  const Perfiles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/personUI.svg",
                        //color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Perfiles',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    IconButton(
                      icon: SocalIcon(
                        iconSrc: "assets/icons/settings.svg",
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 100,
        ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: GridView.builder(
              itemCount: perfiles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //mainAxisSpacing: 20,
                //crossAxisSpacing: 20,
                childAspectRatio: 0.83,
              ),
              itemBuilder: (context, index) => PerfilObj(
                i: index,
                //perfil: perfiles[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              perfil: perfiles[index],
                            ))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
