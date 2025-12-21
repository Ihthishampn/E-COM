import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconname;
  final Color color;
  const CustomIcon({super.key, required this.iconname, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.push('/favorite');
      },
      icon: Icon(
        iconname,
        color: color, // accent
      ),
    );
  }
}
