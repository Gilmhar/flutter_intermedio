import 'package:flutter/material.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        //puntosArriba: true,
        colorPrimario: Colors.red,
        colorSecundario: Colors.teal,
        // bulletPrimario: 15,
        // bulletSecundario: 12,
        slides: [
          SvgPicture.asset('assets/svg/slide-1.svg'),
          SvgPicture.asset('assets/svg/slide-2.svg'),
          SvgPicture.asset('assets/svg/slide-3.svg'),
          SvgPicture.asset('assets/svg/slide-4.svg'),
          SvgPicture.asset('assets/svg/slide-5.svg'),
          SvgPicture.asset('assets/svg/slide-6.svg'),
        ],
      ),
    );
  }
}
