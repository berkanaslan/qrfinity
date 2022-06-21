import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/theme/app_icon.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';

class AppNavigationBar extends StatelessWidget {
  final void Function(int p1) onNavigatorItemTapped;
  final int currentIndex;
  final Color selectedItemColor;

  const AppNavigationBar({
    Key? key,
    required this.onNavigatorItemTapped,
    required this.currentIndex,
    required this.selectedItemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildBottomNavigationBar(),
      ),
    );
  }

  SizedBox _buildBottomNavigationBar() {
    return SizedBox(
      height: BodyWrapper.BOTTOM_NAV_HEIGHT + 36,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: selectedItemColor,
          onTap: onNavigatorItemTapped,
          items: _navigationItems(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _navigationItems() {
    return const [
      BottomNavigationBarItem(
        icon: AppIcon.SCANNER,
        label: "", // TODO: Translate
        tooltip: "Scan", // TODO: Translate
      ),
      BottomNavigationBarItem(
        icon: AppIcon.QR,
        label: "", // TODO: Translate
        tooltip: "Generate", // TODO: Translate
      ),
    ];
  }
}
