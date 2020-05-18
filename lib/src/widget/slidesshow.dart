import 'package:flutter/material.dart';
import 'package:flutter_ui/src/models/slider_model.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  
  const Slideshow({Key key, @required this.slides}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int cantDots = this.slides.length;

    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: _Slides(this.slides),
              ),
              _Dots(cantDots)
            ],
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
        // children: <Widget>[
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
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

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 12,
      width: 12,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) ? Colors.blue : Colors.grey,
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
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
