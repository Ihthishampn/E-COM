import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Home/data/model/cat_product_model.dart';
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
                  if (provider.catState == AppState.loading) {
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

                  if (provider.catState == AppState.error) {
                    return Center(child: Text("try again later"));
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: provider.catList.length,

                    physics: AlwaysScrollableScrollPhysics(),

                    itemBuilder: (context, index) {
                      return CatContainer(
                        category: provider.catList[index],
                        index: index,
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

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            sliver: Consumer<CategoryProvider>(
              builder: (context, provider, _) {
                if (provider.isProductsLoading) {
                  return SliverFillRemaining(
                  child: Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white,
      ),
    ),
                  );
                }

                if (provider.catBasedList.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          'No products available',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                }

                return SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _ProductCard(product: provider.catBasedList[index]);
                  }, childCount: provider.catBasedList.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.72,
                  ),
                );
              },
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final CatProductModel product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 229, 229),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
              child: Image.network(
                product.images.first,
                fit: BoxFit.contain,
                width: double.infinity,
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.image_not_supported)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.brand,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 82, 80, 80),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "₹${product.price}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 63, 171, 67),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
