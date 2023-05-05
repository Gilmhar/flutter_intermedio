import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordersRound extends StatelessWidget {
  const HeaderBordersRound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    );
  }
}

class HeaderDiagonalMedia extends StatelessWidget {
  const HeaderDiagonalMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalMediaPainter(),
      ),
    );
  }
}


class _HeaderDiagonalMediaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderDiagonalCompleta extends StatelessWidget {
  const HeaderDiagonalCompleta({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalCompletaPainter(),
      ),
    );
  }
}

class _HeaderDiagonalCompletaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el paint
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderFlecha extends StatelessWidget {
  const HeaderFlecha({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderFlechaPainter(),
      ),
    );
  }
}

class _HeaderFlechaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el paint
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.50, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvoDoble extends StatelessWidget {
  const HeaderCurvoDoble({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoDoblePainter(),
      ),
    );
  }
}

class _HeaderCurvoDoblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,size.width * 0.50, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15,size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvoDobleAbajo extends StatelessWidget {
  const HeaderCurvoDobleAbajo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoDobleAbajoPainter(),
      ),
    );
  }
}

class _HeaderCurvoDobleAbajoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el paint
    path.moveTo(0, size.height );
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.65,size.width * 0.50, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.85,size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvoDobleGradiente extends StatelessWidget {
  const HeaderCurvoDobleGradiente({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoDobleGradientePainter(),
      ),
    );
  }
}

class _HeaderCurvoDobleGradientePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(center: const Offset(165.0, 55.0), radius: 180);

    const Gradient gradiente = LinearGradient(colors: <Color>[
      Color.fromARGB(239, 125, 206, 27),
      Color.fromARGB(238, 27, 206, 176),
      Color.fromARGB(237, 27, 111, 206)
    ]);
    final paint = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,size.width * 0.50, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15,size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

