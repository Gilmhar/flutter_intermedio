import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? rotacion;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;
  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10000));
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0, 0.50, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 90.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 1.5)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    controller?.addListener(() {
      if (controller?.status == AnimationStatus.completed) {
        //controller?.reverse();
        controller?.reset();
      }
    });
    //Poner aquí el forward hace que no se ejecute la animación automaticamente al guardar los cambios
    //controller?.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //este es como el botón de play/pause del controlador
    //ponerlo aquí hace que al guardar los cambios se ejecute el forward de manera automatica.
    controller?.forward();

    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.translate(
          offset: Offset(moverDerecha!.value, 0),
          child: Transform.rotate(
            angle: rotacion!.value,
            child: Opacity(
              opacity: opacidadOut!.value,
              child: Transform.scale(
                  scale: agrandar?.value, child: childRectangulo),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.green),
    );
  }
}
