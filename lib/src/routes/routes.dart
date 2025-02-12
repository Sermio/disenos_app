import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/pages/animaciones_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/pinteres_page.dart';
import 'package:disenos_app/src/pages/slider_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(
      icons: FontAwesomeIcons.slideshare,
      titulo: 'Slideshow',
      page: const SlideshowPage()),
  _Route(
      icons: FontAwesomeIcons.truckMedical,
      titulo: 'Emergency',
      page: const EmergencyPage()),
  _Route(
      icons: FontAwesomeIcons.heading,
      titulo: 'Heading',
      page: const HeadersPage()),
  _Route(
      icons: FontAwesomeIcons.peopleCarryBox,
      titulo: 'Animated Square',
      page: const CuadradoAnimado()),
  _Route(
      icons: FontAwesomeIcons.circleNotch,
      titulo: 'Progress Bar',
      page: const GraficasCircularesPage()),
  _Route(
      icons: FontAwesomeIcons.pinterest,
      titulo: 'Pinterest',
      page: const PinteresPage()),
  _Route(
      icons: FontAwesomeIcons.mobile,
      titulo: 'Slivers',
      page: const SliverPage()),
];

class _Route {
  _Route({required this.icons, required this.titulo, required this.page});

  final IconData icons;
  final String titulo;
  final Widget page;
}
