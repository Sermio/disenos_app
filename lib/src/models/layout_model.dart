import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideshowPage();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}
