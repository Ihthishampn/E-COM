import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/features/Home/presentation/provider/popular_prodcuts_provider.dart';
import 'package:e_com/features/Home/presentation/widgets/popular_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularContainerParentWid extends StatelessWidget {
  const PopularContainerParentWid({super.key});

  @override
  Widget build(BuildContext context) {
    return    SliverToBoxAdapter(
              child: SizedBox(
                height: 280,
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
                        return PopularContainer(index: index);
                      },
                    );
                  },
                ),
              ),
            );
  }
}