import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinteresPage extends StatelessWidget {
  const PinteresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
        // body: PinterestMenu(),
        // body: Center(
        //   child: PinterestGrid(),
        // ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: widthPantalla,
          child: Row(
            children: [
              const Spacer(),
              PinterestMenu(
                mostrar: mostrar,
                backgroundColor: appTheme.scaffoldBackgroundColor,
                activeColor: appTheme.indicatorColor,
                items: [
                  PinterestButton(
                      icon: Icons.pie_chart,
                      onPressed: () {
                        print('iconPie');
                      }),
                  PinterestButton(
                      icon: Icons.search,
                      onPressed: () {
                        print('search');
                      }),
                  PinterestButton(
                      icon: Icons.notifications,
                      onPressed: () {
                        print('notifications');
                      }),
                  PinterestButton(
                      icon: Icons.supervised_user_circle,
                      onPressed: () {
                        print('supervised_user_circle');
                      }),
                ],
                // backgroundColor: Colors.red,
                // activeColor: Colors.red,
                // inactiveColor: Colors.blue,
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(
    200,
    (index) => index,
  );

  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(
      () {
        if (controller.offset > scrollAnterior && controller.offset > 150) {
          Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        } else {
          Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        }
        scrollAnterior = controller.offset;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (context, index) => _PinteresItem(index),
      staggeredTileBuilder: (index) =>
          StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  const _PinteresItem(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
