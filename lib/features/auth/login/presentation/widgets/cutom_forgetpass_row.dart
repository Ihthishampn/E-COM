import 'package:flutter/material.dart';

class CustomForgetpassRow extends StatelessWidget {
  const CustomForgetpassRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .end,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // logic
            },
            child: Text(
              'Forget Password?',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 27),
      ],
    );
  }
}
