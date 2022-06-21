import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/widget/navigation_bar/app_navigation_bar.dart';
import 'package:qrfinity/src/view/home/barcode_generator_page.dart';
import 'package:qrfinity/src/view/home/barcode_scanner_page.dart';

class HomeView extends StatefulWidget {
  static const String ROUTE = "/";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildPageView(),
        _buildAppNavigationBar(),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: _onPageChanged,
      children: const [
        BarcodeScannerPage(),
        BarcodeGeneratorPage(),
      ],
    );
  }

  AppNavigationBar _buildAppNavigationBar() {
    return AppNavigationBar(
      onNavigatorItemTapped: _onNavigatorItemTapped,
      currentIndex: currentPageIndex,
      selectedItemColor: currentPageIndex == 0 ? AppColor.MIDNIGHT_BLUE : AppColor.ORANGE,
    );
  }

  void _onNavigatorItemTapped(int index) {
    currentPageIndex = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _onPageChanged(index) {
    currentPageIndex = index;
    setState(() {});
  }
}
