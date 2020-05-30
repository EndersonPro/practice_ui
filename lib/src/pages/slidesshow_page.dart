import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/src/widget/slidesshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red,
        body: Column(
      children: <Widget>[
        Expanded(child: MiSlideShow()),
        Expanded(child: MiSlideShow())
      ],
    ));
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      // topDots: true,
      bulletPrimary: 12.0,
      bulletSeconday: 9,
      // colorPrimaryDots: Colors.red,
      // colorSecundaryDots: Colors.white,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slider-1.svg'),
        SvgPicture.asset('assets/svgs/slider-2.svg'),
        SvgPicture.asset('assets/svgs/slider-3.svg'),
        SvgPicture.asset('assets/svgs/slider-4.svg'),
      ],
    );
  }
}
