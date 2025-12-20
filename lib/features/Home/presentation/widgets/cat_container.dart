import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Home/presentation/provider/category_provider.dart';
import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatContainer extends StatelessWidget {
  final int index;
  final String category;

  const CatContainer({super.key, required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors
        .categoryColors[category.hashCode % AppColors.categoryColors.length];

    return Selector<CategoryProvider, String>(
      selector: (_, p) => p.selectedCat,
      builder: (context, selectedCat, _) {
        final isSelected = selectedCat == category;

        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.read<CategoryProvider>().changeCat(category);
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : bgColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: bgColor.withOpacity(0.9),
                      ),
                    ]
                  : [],
            ),
            child: KText(
              text: category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              color: Colors.white,
              weight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
