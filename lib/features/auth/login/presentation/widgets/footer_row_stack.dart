import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterRowStack extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  final String buttonName;
  const FooterRowStack({
    super.key,
    required this.title,
    required this.buttonName, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,

      children: [
        KText(
          text: title,
          weight: FontWeight.w600,
          fontSize: 15,
          color: const Color.fromARGB(255, 108, 110, 115),
        ),
        Material(
          color: Colors.transparent,
          child: InkResponse(
            onTap: ontap,
            child: Text(
              buttonName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: const Color.fromARGB(255, 64, 104, 164),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
