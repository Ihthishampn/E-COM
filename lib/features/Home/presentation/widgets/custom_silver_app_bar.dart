import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Home/presentation/widgets/carousel_images.dart';
import 'package:e_com/features/Home/presentation/widgets/custom_icon.dart';
import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.bg,
      title: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bg.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                CustomIcon(
                  iconname: Icons.person,
                  color: const Color.fromARGB(255, 213, 214, 216),
                ),

                const SizedBox(width: 12),
              ],
            ),
           const KText(
              text: 'E  COM',
              weight: FontWeight.bold,
              fontSize: 21,
              color:  Color.fromARGB(255, 86, 160, 203),
            ),
            //
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                

                const SizedBox(width: 12),
                CustomIcon(
                  iconname: Icons.favorite_border,
                  color: const Color.fromARGB(255, 218, 21, 21),
                ),

                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),

      expandedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: CarouselImages(),
        ),
      ),
    );
  }
}
