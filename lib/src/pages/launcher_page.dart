import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('diseños en flutter'),
        backgroundColor: Colors.blue,
      ),
      drawer: const _MenuPrincipal(),
      body: const _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.currentTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icons,
          color: appTheme.currentTheme.indicatorColor,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.currentTheme.indicatorColor,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.indicatorColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: const Text(
                    'MT',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            const Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor,
              ),
              title: const Text('Dark mode'),
              trailing: Switch.adaptive(
                  activeColor: accentColor,
                  value: appTheme.darkTheme,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  }),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: accentColor,
                ),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                    activeColor: accentColor,
                    value: appTheme.customTheme,
                    onChanged: (value) {
                      appTheme.customTheme = value;
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
