import 'package:flutter/material.dart';

class DividerEither extends StatelessWidget {
  const DividerEither({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Text('or'),
              ),
              Expanded(child: Divider()),
            ],
          ),
        );
  }
}