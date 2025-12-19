import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/auth/signUp/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Size size;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.size,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 97, 167, 99),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: size.width * 0.04,
            horizontal: size.width * 0.36,
          ),
        ),
      ),

      child: Text(
        text,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
