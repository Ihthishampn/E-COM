import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/features/Home/presentation/provider/category_provider.dart';
import 'package:e_com/features/Home/presentation/widgets/catagory_widgets/cat_select_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatSelectChipParent extends StatelessWidget {
  const CatSelectChipParent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                return CatSelectChips(
                  category: provider.catList[index],
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
