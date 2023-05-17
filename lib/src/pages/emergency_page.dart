import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:disenos_app/src/widgets/headers.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1Backg;
  final Color color2Backg;

  ItemBoton(this.icon, this.texto, this.color1Backg, this.color2Backg);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(
          FontAwesomeIcons.carBurst,
          'Motor Accident',
          const Color.fromARGB(255, 77, 31, 185),
          const Color.fromARGB(255, 138, 104, 238)),
      ItemBoton(
          FontAwesomeIcons.plus,
          'Medical Emergency',
          const Color.fromARGB(255, 76, 157, 243),
          const Color.fromARGB(255, 46, 76, 245)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(
          FontAwesomeIcons.personBiking,
          'Awards',
          const Color.fromARGB(255, 40, 114, 134),
          const Color.fromARGB(255, 86, 179, 148)),
      ItemBoton(
          FontAwesomeIcons.carBurst,
          'Motor Accident',
          const Color.fromARGB(255, 77, 31, 185),
          const Color.fromARGB(255, 138, 104, 238)),
      ItemBoton(
          FontAwesomeIcons.plus,
          'Medical Emergency',
          const Color.fromARGB(255, 76, 157, 243),
          const Color.fromARGB(255, 46, 76, 245)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(
          FontAwesomeIcons.personBiking,
          'Awards',
          const Color.fromARGB(255, 40, 114, 134),
          const Color.fromARGB(255, 86, 179, 148)),
      ItemBoton(
          FontAwesomeIcons.carBurst,
          'Motor Accident',
          const Color.fromARGB(255, 77, 31, 185),
          const Color.fromARGB(255, 138, 104, 238)),
      ItemBoton(
          FontAwesomeIcons.plus,
          'Medical Emergency',
          const Color.fromARGB(255, 76, 157, 243),
          const Color.fromARGB(255, 46, 76, 245)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(
          FontAwesomeIcons.personBiking,
          'Awards',
          const Color.fromARGB(255, 40, 114, 134),
          const Color.fromARGB(255, 86, 179, 148)),
    ];

    List<Widget> itemMap = items
        .map((e) => FadeInLeft(
          duration: const Duration(milliseconds: 850),
          child: BotonGordo(
                icon: e.icon,
                texto: e.texto,
                color1Backg: e.color1Backg,
                color2Backg: e.color2Backg,
                onPress: () {
                  //Cada que se oprime el botón se puede imprimi el mensaja para comprobar que se está ejecutando la función.
                  //print('Hola');
                },
              ),
        ))
        .toList();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 18, 18, 20),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  ...itemMap,
                ],
              ),
            ),
            _Encabezado()
          ],
        ));
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const IconHeader(
          icon: FontAwesomeIcons.heartPulse,
          titulo: 'Asistencia Médica',
          subtitulo: 'Haz solicitado',
          color1Backg: Color.fromARGB(255, 26, 190, 62),
          color2Backg: Color.fromARGB(255, 154, 236, 46),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
                onPressed: () {},
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15.0),
                child: const FaIcon(FontAwesomeIcons.ellipsisVertical,
                    color: Colors.white)))
      ],
    );
  }
}

//esta clase solo sirvió para poder modelar y ver el diseño de los botones, por eso ya no se manda llamar y ya no se implementa. Por eso esta comentada.
// class BotonGordoTemp extends StatelessWidget {
//   const BotonGordoTemp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BotonGordo(
//       icon: FontAwesomeIcons.carBurst,
//       texto: 'Motor Accident',
//       color1Backg: const Color.fromARGB(255, 86, 179, 148),
//       color2Backg: const Color.fromARGB(255, 40, 114, 134),
//       onPress: () {
//         //Cada que se oprime el botón se puede imprimi el mensaja para comprobar que se está ejecutando la función.
//         //print('tap');
//       },
//     );
//   }
// }

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia Médica',
      color1Backg: Color.fromARGB(255, 26, 190, 62),
      color2Backg: Color.fromARGB(255, 154, 236, 46),
    );
  }
}
