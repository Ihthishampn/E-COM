import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Home/presentation/provider/category_provider.dart';
import 'package:e_com/features/Home/presentation/provider/popular_prodcuts_provider.dart';
import 'package:e_com/features/Home/presentation/widgets/cat_container.dart';
import 'package:e_com/features/Home/presentation/widgets/popular_container.dart';
import 'package:e_com/features/Home/presentation/widgets/custom_silver_app_bar.dart';
import 'package:e_com/features/Widgets/k_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          // app bar
          CustomSilverAppBar(),
          // catagory
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: KText(
                text: " Top 10",
                weight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromARGB(255, 202, 205, 206),
              ),
            ),
          ),
          // popular container....
          SliverToBoxAdapter(
            child: SizedBox(
              height: 260,
              child: Consumer<PopularProdcutsProvider>(
                builder: (context, p, child) {
                  if (p.state == AppState.loading) {
                    return const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  }
                  if (p.state == AppState.error) {
                    return Center(child: Text(p.error));
                  }

                  return ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: p.list.length,
                    itemBuilder: (context, index) {
                      return CategoryContainer(index: index);
                    },
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Consumer<CategoryProvider>(
                builder: (context, provider, child) {
                  if (provider.state == AppState.loading) {
                    return const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }

                  if (provider.state == AppState.error) {
                    return Center(child: Text("try again later"));
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: provider.catList.length,

                    physics: AlwaysScrollableScrollPhysics(),

                    itemBuilder: (context, index) {
                      return CatContainer(
                        index: index,
                        provider: provider.catList[index],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 15)),

          // Content placeholder
          // cat based prodcuts
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(child: Divider(endIndent: 21, indent: 21)),
                Selector<CategoryProvider,String>(builder: (context, value, child) {
                  

return KText(
                  text: value.toUpperCase(),
                  color: Colors.amber,
                  fontSize: 16,
                  weight: FontWeight.bold,
                );

                }, selector: (_, pro) => pro.selectedCat,),
                Expanded(child: Divider(endIndent: 21, indent: 21)),
              ],
            ),
          ),

          SliverToBoxAdapter(child: const SizedBox(height: 10)),

          SliverPadding(
            padding: EdgeInsetsGeometry.only(left: 14, right: 14),
            sliver: SliverGrid.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.82, // taller items

                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    color: Colors.amber,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
