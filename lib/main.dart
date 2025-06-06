import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
import 'package:disenos_app/src/pages/pinteres_page.dart';
import 'package:disenos_app/src/pages/slider_list_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
// import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
    ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel()),
  ], child: const MyApp()));
}
// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (_) => ThemeChanger(2), child: const MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}
