import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorArco;
  final Color colorFondo;
  final double grosorFondo;
  final double grosorArco;

  const RadialProgress(
      {super.key,
      required this.porcentaje,
      this.colorArco = Colors.indigoAccent,
      this.colorFondo = Colors.grey,
      this.grosorFondo = 6,
      this.grosorArco = 6});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;

    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
                (widget.porcentaje - diferenciaAnimar) +
                    (diferenciaAnimar * controller!.value),
                widget.colorArco,
                widget.colorFondo,
                widget.grosorFondo,
                widget.grosorArco),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final num porcentaje;
  final Color colorArco;
  final Color colorFondo;
  final double grosorFondo;
  final double grosorArco;

  _MiRadialProgress(this.porcentaje, this.colorArco, this.colorFondo,
      this.grosorFondo, this.grosorArco);
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    const Gradient gradiente = LinearGradient(
        colors: <Color>[Color(0xffC012FF), Color(0xff6D05E8), Colors.red]);
    //Circulo completo
    final paintCirculoBase = Paint()
      ..strokeWidth = grosorFondo
      ..color = colorFondo
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height / 2);

    canvas.drawCircle(center, radio, paintCirculoBase);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = grosorArco
      //..color = colorArco
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //El relleno del arco
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
