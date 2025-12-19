import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Home/presentation/provider/category_provider.dart';
import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatContainer extends StatelessWidget {
  final int index;
  final String provider;

  const CatContainer({super.key, required this.index, required this.provider});

  @override
  Widget build(BuildContext context) {
    final bgColor =
        AppColors.categoryColors[index % AppColors.categoryColors.length];

    return Selector<CategoryProvider, String>(
      selector: (_, p) => p.selectedCat,
      builder: (context, selectedCat, _) {
        final isSelected = selectedCat == provider;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            onTap: () {



              context.read<CategoryProvider>().changeCat(provider);

  //  cat list product provider logic ivide....


            },
            child: Container(
              margin: const EdgeInsets.all(6),
              width: 90,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? bgColor
                    : bgColor.withOpacity(0.4), // 👈 visual feedback
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
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
                text: provider,
                weight: FontWeight.w600,
                fontSize: 15,
                color: Colors.white,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
