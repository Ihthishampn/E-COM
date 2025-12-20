import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';

class EmptyCartContainer extends StatelessWidget {
  const EmptyCartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Icon(
                Icons.shopping_cart_outlined,
                size: 90,
                color: Colors.grey.shade600,
              ),
              const SizedBox(height: 20),
              const KText(
                text: "Your cart is empty",
                fontSize: 22,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              KText(
                text: "Looks like you haven't added anything yet.",
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pop or go to home
                  },
                  child: const KText(
                    text: "Start Shopping",
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
  }
}