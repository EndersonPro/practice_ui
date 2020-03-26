import 'package:flutter/material.dart';

class LoginPageOne extends StatelessWidget {
  const LoginPageOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heigthContainer = size.height * .37;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: heigthContainer,
            width: size.width,
            child: CustomPaint(
              painter: _HeaderLoginPainterBack(),
            ),
          ),
          Container(
            height: heigthContainer,
            width: size.width,
            child: CustomPaint(
              painter: _HeaderLoginPainterMedium(),
            ),
          ),
          Container(
            height: heigthContainer,
            width: size.width,
            child: CustomPaint(
              child: Center(
                child: Icon(
                  Icons.adb,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              painter: _HeaderLoginPainterFront(),
            ),
          ),
          _formulario(context, size, heigthContainer),
        ],
      ),
    );
  }

  Widget _formulario(BuildContext context, Size size, double heigthContainer) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 70, right: size.width * .12, left: size.width * .12),
        child: Container(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Container(
                  height: heigthContainer,
                ),
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.5)),
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(Icons.email)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.2)),
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(Icons.vpn_key)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.all(15),
                      child: FlatButton(
                          color: Color(0xff1566e0),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          onPressed: () => {}),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Olvidé la contraseña');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff1566e0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.watch_later,
                            size: 40,
                          ),
                          Icon(
                            Icons.watch_later,
                            size: 40,
                          ),
                          Icon(
                            Icons.watch_later,
                            size: 40,
                          ),
                          Icon(
                            Icons.watch_later,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderLoginPainterFront extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Color(0xff1566e0);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * .25, size.height * .87, size.width * .5, size.height);
    path.quadraticBezierTo(
        size.width * .75, size.height * 1.13, size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderLoginPainterMedium extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Color(0xff1566e0).withOpacity(0.2);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * .25, size.height * .92, size.width * .41, size.height);
    path.quadraticBezierTo(
        size.width * .85, size.height * 1.19, size.width, size.height * 1.15);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderLoginPainterBack extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Color(0xff1566e0).withOpacity(0.03);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    path.lineTo(0, size.height * 1.05);
    path.quadraticBezierTo(size.width * (1 / 8), size.height * 1.03,
        size.width * .25, size.height * 1.05);
    path.quadraticBezierTo(size.width, size.height * 1.13, size.width, 0);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
