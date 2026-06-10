import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  final List<Widget> children;
  final Widget? appBar;

  const DashboardView({
    super.key,
    required this.children,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          if (appBar != null) appBar!,
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
