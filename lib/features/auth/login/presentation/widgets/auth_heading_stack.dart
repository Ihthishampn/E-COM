import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';

class AuthHeadingStack extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthHeadingStack({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        KText(
          text: title,
          weight: FontWeight.bold,
          fontSize: 21,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        const SizedBox(height: 3),

        KText(
          text: subtitle,
          weight: FontWeight.w500,
          fontSize: 11,
          color: const Color.fromARGB(255, 65, 65, 65),
        ),
      ],
    );
  }
}
