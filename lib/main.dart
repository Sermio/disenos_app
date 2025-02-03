import 'package:disenos_app/src/pages/animaciones_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diseños App',
      home: CuadradoAnimadoPage(),
    );
  }
}
