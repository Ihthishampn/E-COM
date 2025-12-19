import 'package:e_com/core/utils/color_theme.dart';
import 'package:flutter/material.dart';

class WhiteStackBgContainer extends StatelessWidget {
  const WhiteStackBgContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
    );
  }
}
