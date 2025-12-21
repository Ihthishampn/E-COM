import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/Home/presentation/provider/popular_prodcuts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularContainer extends StatelessWidget {
  final int index;
  const PopularContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularProdcutsProvider>(
      builder: (context, provider, _) {
        final item = provider.list[index];

        return Container(
          width: 250,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(14),
                    ),
                    child: Container(
                      height: 140,
                      color: const Color(0xFF2A2A2A),
                      padding: const EdgeInsets.all(12),
                      child: CachedNetworkImage(
                        imageUrl: item.images.first,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        placeholder: (_, __) => const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        errorWidget: (_, __, ___) =>
                            const Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                  ),

                  // DETAILS
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${item.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // 🔥 POPULAR BADGE
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.local_fire_department,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),

              // INDEX BADGE
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '#${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
