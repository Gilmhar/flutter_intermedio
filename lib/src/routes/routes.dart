import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/pinterest_page.dart';
import 'package:disenos_app/src/pages/slider_list_page.dart';
import 'package:disenos_app/src/retos/cuadrado_animado.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlidesShowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro animado',
      const CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra progreso',
      const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
