import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/src/widget/slidesshow.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        slides: <Widget>[
          SvgPicture.asset('assets/svgs/slider-1.svg'),
          SvgPicture.asset('assets/svgs/slider-2.svg'),
          SvgPicture.asset('assets/svgs/slider-3.svg'),
          SvgPicture.asset('assets/svgs/slider-4.svg'),
        ],
      )
    );
  }
}