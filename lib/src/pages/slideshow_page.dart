import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      const Expanded(child: MiSlideshow()),
      const Expanded(child: MiSlideshow())
    ];

    return Scaffold(
      body: (isLarge)
          ? Column(
              children: children,
            )
          : Row(
              children: children,
            ),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.indicatorColor;

    return Slideshow(
      puntosArriba: false,
      colorPrimario:
          (appTheme.darkTheme) ? accentColor : const Color(0xffFF5A7E),
      bulletPrimario: 20,
      bulletSecundario: 10,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
      ],
    );
  }
}
