import 'package:e_com/features/favorite/data/model/favorite_model.dart';
import 'package:e_com/features/favorite/presentation/provider/fav_provider.dart';
import 'package:e_com/features/favorite/presentation/widgets/fav_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavProvider>(
        builder: (context, value, child) => StreamBuilder(
          stream: value.handleGetFav(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error loading favorites'));
            }
            final fav = snapshot.data ?? [];
            if (fav.isEmpty) {
              return const Center(child: Text('No favorites'));
            }
            return ListView.builder(
              itemCount: fav.length,
              itemBuilder: (context, index) => FavContainer(
                model: fav[index],
                onAddToCart: () {
                  
                },
                onRemove: () {
                  
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
