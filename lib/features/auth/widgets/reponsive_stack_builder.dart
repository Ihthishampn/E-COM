import 'package:flutter/material.dart';

class ResponsiveStackBuilder extends StatelessWidget {
  final Widget Function(double w, double h) builder;
  const ResponsiveStackBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return builder(w, h);
      },
    );
  }
}
