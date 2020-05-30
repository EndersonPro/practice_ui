import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final topDots;
  final Color colorPrimaryDots;
  final Color colorSecundaryDots;
  final double bulletPrimary;
  final double bulletSeconday;

  const Slideshow(
      {Key key,
      @required this.slides,
      this.topDots = false,
      this.colorPrimaryDots = Colors.blue,
      this.colorSecundaryDots = Colors.grey,
      this.bulletPrimary = 12.0,
      this.bulletSeconday = 12.0
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int cantDots = this.slides.length;

    return ChangeNotifierProvider(
      create: (_) => new _SliderShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (BuildContext context) {
            Provider.of<_SliderShowModel>(context).colorPrimaryDots =
                this.colorPrimaryDots;
            Provider.of<_SliderShowModel>(context).colorSecondaryDots =
                this.colorSecundaryDots;
            Provider.of<_SliderShowModel>(context).bulletPrimary =
                this.bulletPrimary;
            Provider.of<_SliderShowModel>(context).bulletSecondary =
                this.bulletSeconday;

            return Column(
              children: <Widget>[
                this.topDots ? _Dots(cantDots) : Container(),
                Expanded(
                  child: _Slides(this.slides),
                ),
                !this.topDots ? _Dots(cantDots) : Container()
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int cantDots;

  const _Dots(this.cantDots);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(cantDots, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final sliderShowModel = Provider.of<_SliderShowModel>(context);
    Color color;
    double tamano;

    if ((sliderShowModel.currentPage >= index - 0.5 && sliderShowModel.currentPage < index + 0.5)) {
        tamano = sliderShowModel.bulletPrimary;
        color = sliderShowModel.colorPrimaryDots;

    } else {
        tamano = sliderShowModel.bulletSecondary;
        color = sliderShowModel.colorSecondaryDots;

    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageController = new PageController();

  @override
  void initState() {
    pageController.addListener(() {
      Provider.of<_SliderShowModel>(context, listen: false).currentPage =
          pageController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
        //
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}

class _SliderShowModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimaryDots = Colors.blue;
  Color _colorSecondaryDots = Colors.grey;
  double _bulletPrimary = 12;
  double _bulletSecondary = 12;

  double get currentPage => _currentPage;

  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }

  Color get colorPrimaryDots => this._colorPrimaryDots;
  Color get colorSecondaryDots => this._colorSecondaryDots;
  double get bulletPrimary => this._bulletPrimary;
  double get bulletSecondary => this._bulletSecondary;

  set bulletPrimary(double b) {
    this._bulletPrimary = b;
  }

  set bulletSecondary(double b) {
    this._bulletSecondary = b;
  }

  set colorPrimaryDots(Color color) {
    this._colorPrimaryDots = color;
  }

  set colorSecondaryDots(Color color) {
    this._colorSecondaryDots = color;
  }
}
