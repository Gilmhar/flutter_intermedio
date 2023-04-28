import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Slideshow(),
      ),
    );
  }
}
