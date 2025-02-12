import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.indicatorColor;

    return Scaffold(
      body: HeaderWave(color: accentColor),
    );
  }
}
