import 'package:flutter/material.dart';

class BodyWrapper extends StatefulWidget {
  final Color backgroundColor;
  final Widget body;

  const BodyWrapper({
    Key? key,
    required this.backgroundColor,
    required this.body,
  }) : super(key: key);

  @override
  State<BodyWrapper> createState() => _BodyWrapperState();
}

class _BodyWrapperState extends State<BodyWrapper> with AutomaticKeepAliveClientMixin<BodyWrapper> {
  late final Color backgroundColor;
  late final Widget body;

  static const double _BOTTOM_NAV_HEIGHT = 56;
  static const double _BOTTOM_NAV_MARGIN = 16;
  static const double _BODY_BOTTOM_WHITESPACE = 16;

  @override
  void initState() {
    super.initState();
    backgroundColor = widget.backgroundColor;
    body = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(elevation: 0, backgroundColor: backgroundColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 90, child: body),
          const SizedBox(height: _BOTTOM_NAV_HEIGHT + _BOTTOM_NAV_MARGIN + _BODY_BOTTOM_WHITESPACE),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
