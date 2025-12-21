import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Home/presentation/provider/category_provider.dart';
import 'package:e_com/features/Home/presentation/widgets/catagory_widgets/cat_based_grid_parent.dart';
import 'package:e_com/features/Home/presentation/widgets/catagory_widgets/cat_select_chips_parent.dart';
import 'package:e_com/features/Home/presentation/widgets/custom_silver_app_bar.dart';
import 'package:e_com/features/Home/presentation/widgets/popular_widgets/popular_container_parent_.dart';
import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: CustomScrollView(
          slivers: [
            // app bar
            CustomSilverAppBar(),
            // catagory
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: KText(
                  text: " Top 10",
                  weight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 202, 205, 206),
                ),
              ),
            ),
            // popular container....
            PopularContainerParentWid(),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            // seccion like a choice chips for select catagoury
            CatSelectChipParent(),
            SliverToBoxAdapter(child: const SizedBox(height: 15)),

            // selcted cat showing as a text with  lines
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(child: Divider(endIndent: 21, indent: 21)),
                  Selector<CategoryProvider, String>(
                    builder: (context, value, child) {
                      return KText(
                        text: value.toUpperCase(),
                        color: Colors.amber,
                        fontSize: 16,
                        weight: FontWeight.bold,
                      );
                    },
                    selector: (_, pro) => pro.selectedCat,
                  ),
                  Expanded(child: Divider(endIndent: 21, indent: 21)),
                ],
              ),
            ),

            SliverToBoxAdapter(child: const SizedBox(height: 10)),
            // cat based seccion products of slected catogary
            CatBasedGridParent(),

            SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
