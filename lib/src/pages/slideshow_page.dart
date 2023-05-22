import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:disenos_app/src/theme/them_changer.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow())
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final  appTheme2 = Provider.of<ThemeChanger>(context).currentTheme;
    return Slideshow(
      //puntosArriba: true,
      colorPrimario:(appTheme.darkTheme) ? appTheme2.colorScheme.secondary : Colors.amber,
      colorSecundario: (appTheme.darkTheme) ? appTheme.currentTheme.highlightColor  : Colors.blue,
      bulletPrimario: 12,
      bulletSecundario: 8,
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
        SvgPicture.asset('assets/svg/slide-6.svg'),
      ],
    );
  }
}
