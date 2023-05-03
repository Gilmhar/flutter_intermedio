import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import 'package:disenos_app/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget>? slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  // final int bulletPrimario;
  // final int bulletSecundario;

  const Slideshow({
    super.key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.amber,
    this.colorSecundario = Colors.blue,
    // this.bulletPrimario,
    // this.bulletSecundario,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(builder: (BuildContext context) {
          Provider.of<_SlideshowModel>(context)._colorPrimario = colorPrimario;
          Provider.of<_SlideshowModel>(context)._colorSecundario =
              colorSecundario;
          // Provider.of<_SlideshowModel>(context)._bulletPrimario = bulletPrimario;
          // Provider.of<_SlideshowModel>(context)._bulletSecundario = bulletSecundario;
          return _EstructuraSlideshow(
              puntosArriba: puntosArriba, slides: slides);
        })),
      ),
    );
  }
}

class _EstructuraSlideshow extends StatelessWidget {
  const _EstructuraSlideshow({
    super.key,
    required this.puntosArriba,
    required this.slides,
  });

  final bool puntosArriba;
  final List<Widget>? slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(slides!.length),
        Expanded(child: _Slides(slides!)),
        if (!puntosArriba) _Dots(slides!.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  // final Color colorPrimario;
  // final Color colorSecundario;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  // final Color colorPrimario;
  // final Color colorSecundario;

  const _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    print('CurrentPage: ${ssModel.getCurrentPage}');
    print('Index: $index');
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (ssModel.getCurrentPage >= index - 0.5 &&
                  ssModel.getCurrentPage < index + 0.5)
              ? ssModel.getColorPrimario
              : ssModel.getColorSecundario,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).setCurrentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(2),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.amber;
  Color _colorSecundario = Colors.blue;

  double get getCurrentPage => _currentPage;

  set setCurrentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get getColorPrimario => _colorPrimario;

  set setColorPrimario(Color colorPrimario) {
    _colorPrimario = colorPrimario;
    notifyListeners();
  }

  Color get getColorSecundario => _colorSecundario;

  set setColorSecundario(Color colorSecundario) {
    _colorSecundario = colorSecundario;
    notifyListeners();
  }
}
