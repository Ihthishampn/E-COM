import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconname;
  final Color color;
  const CustomIcon({super.key, required this.iconname, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
     iconname,
      color:color, // accent
    );
  }
}
