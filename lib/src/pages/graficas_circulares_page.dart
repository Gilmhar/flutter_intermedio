import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:disenos_app/src/theme/them_changer.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color:  Colors.redAccent,),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, color: const Color.fromARGB(255, 79, 173, 219),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.amber,),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, color: const Color.fromARGB(255, 61, 172, 64),),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorArco: color,
        colorFondo: appTheme.textTheme.bodyLarge?.color ?? Colors.grey,
        grosorFondo: 6,
        grosorArco: 12,
      ),
      // child: Text(
      //   '$porcentaje%',
      //   style: const TextStyle(fontSize: 50.0),
      // )
    );
  }
}
