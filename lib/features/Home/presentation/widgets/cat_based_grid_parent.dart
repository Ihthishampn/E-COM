import 'package:e_com/features/Home/presentation/provider/category_provider.dart';
import 'package:e_com/features/Home/presentation/widgets/cat_based_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatBasedGridParent extends StatelessWidget {
  const CatBasedGridParent({super.key});

  @override
  Widget build(BuildContext context) {
    return   SliverPadding(
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
                      return ProductCard(product: provider.catBasedList[index]);
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
            );
  }
}