import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  bool get isKeyBoardOpened => MediaQuery.of(this).viewInsets.bottom > 0;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}

extension MediaQueryExtension on BuildContext {
  bool get isMobile => mediaQuery.size.shortestSide <= 650;

  bool get isTablet => mediaQuery.size.shortestSide > 650;

  bool get isDesktop => mediaQuery.size.shortestSide >= 1100;

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;
}
