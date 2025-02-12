import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          const Positioned(bottom: -10, right: 0, child: _BotonNewList())
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTHeme = Provider.of<ThemeChanger>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        backgroundColor: (appTHeme.darkTheme)
            ? appTHeme.currentTheme.indicatorColor
            : const Color(0xffED6762),
        // backgroundColor: const Color(0xffED6762),
        minimumSize: Size(size.width * 0.9, 100),
      ),
      onPressed: () {},
      child: Text(
        'CREATE NEW LIST',
        style: TextStyle(
            color: appTHeme.currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  _MainScroll({super.key});

  final items = [
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      slivers: [
        // const SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('ola'),
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              minHeight: 200,
              maxHeight: 210,
              child: Container(
                alignment: Alignment.centerLeft,
                color: appTheme.scaffoldBackgroundColor,
                child: const _Titulo(),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
                color: (appTheme.darkTheme)
                    ? Colors.grey
                    : const Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 16,
              child: Container(
                width: 150,
                height: 8,
                decoration: BoxDecoration(
                  color: (appTheme.darkTheme)
                      ? Colors.grey
                      : const Color(0xff532128),
                ),
              ),
            ),
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  _ListaTareas({
    super.key,
  });

  final items = [
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({required this.titulo, required this.color});

  final String titulo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      padding: const EdgeInsetsDirectional.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
          color: (appTheme.darkTheme) ? Colors.grey : color,
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
