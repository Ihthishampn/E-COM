import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Widgets/k_text.dart';
import 'package:e_com/features/cart/presentation/widgets/empty_cart_container.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ],
          title: const KText(
            text: 'Your Cart',
            color: Colors.white,
            weight: FontWeight.bold,
          ),
        ),
        body: EmptyCartContainer(),
      ),
    );
  }
}
