import 'package:flutter/material.dart';
import 'package:flutter_ui/src/widget/button_fat.dart';
import 'package:flutter_ui/src/widget/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
                  child: ButtonFat(
                icon: item.icon,
                text: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  print('Hola');
                },
              ),
        ))
        .toList();

    return Scaffold(
        body: Center(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 200.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                ...itemMap
              ],
            ),
          ),
          Stack(children: [
            IconHeader(
              icon: FontAwesomeIcons.plus,
              title: 'Asistencia Médica',
              subtitle: 'Haz solicitado',
              color1: Color(0xff66A9F2),
              color2: Color(0xff536CF6),
            ),
            Positioned(
              right: 0,
              top: 45,
              child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                padding: EdgeInsets.all(12.0),
                child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)),
            )
          ]),
        ],
      ),
    ));
  }
}

class ButtonFatTemp extends StatelessWidget {
  const ButtonFatTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonFat(
        icon: FontAwesomeIcons.carCrash,
        text: 'Motor Accident',
        onPress: () {
          print('Pressss');
        },
        color1: Color(0xff6989f5),
        color2: Color(0xff906ef5));
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Asistencia Medica',
      subtitle: 'Haz Solicitado',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
