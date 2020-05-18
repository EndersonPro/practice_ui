import 'package:flutter/material.dart';
import 'package:flutter_ui/src/widget/radial_progress.dart';

class GraficasPages extends StatefulWidget {
  const GraficasPages({Key key}) : super(key: key);

  @override
  _GraficasPagesState createState() => _GraficasPagesState();
}

class _GraficasPagesState extends State<GraficasPages> {
  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) percentage = 0;
          });
        },
      ),
      body: Center(
        // child: Text('$percentage %',style: TextStyle(fontSize: 50.0),),
        child: Container(
          width: 300,
          height: 300,
            child: RadialProgress(
          percentage: percentage,
        )),
      ),
    );
  }
}
