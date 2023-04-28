import 'package:flutter/material.dart';
//TODO: Borrar
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => SliderModel(),
    child: Center(
          // child: SvgPicture.asset('assets/svg/slide-4.svg'),
          child:Column(
            children: [
               Expanded(child: _Slides()),
               _Dots()
            ],
          )
        ),);
  }
}

class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageIndex = Provider.of<SliderModel>(context).getCurrentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageIndex >= index - 0.5 && pageIndex < index + 0.5) 
        ? Colors.blue : Colors.amber,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() { 
      Provider.of<SliderModel>(context, listen: false).setCurrentPage = pageViewController.page!;
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
      children: const [
        _Slide('assets/svg/slide-1.svg'),
        _Slide('assets/svg/slide-2.svg'),
        _Slide('assets/svg/slide-3.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(2),
      child: SvgPicture.asset(svg),
    );
  }
}