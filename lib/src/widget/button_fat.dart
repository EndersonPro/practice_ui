import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonFat extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPress;

  const ButtonFat(
      {Key key,
      @required this.icon,
      @required this.text,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _ButtonFatBackground(
              icon: this.icon, color1: this.color1, color2: this.color2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 140, width: 40),
              FaIcon(this.icon, size: 40, color: Colors.white),
              SizedBox(width: 20),
              Expanded(
                  child: Text(this.text,
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40)
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonFatBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _ButtonFatBackground({Key key, this.icon, this.color1, this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: FaIcon(this.icon,
                  size: 150, color: Colors.white.withOpacity(.2)),
              right: -20,
              top: -20,
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(.2),
              offset: Offset(4, 6),
              blurRadius: 10.0)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[this.color1, this.color2],
        ),
      ),
    );
  }
}
