import 'package:e_com/features/Home/data/model/cat_product_model.dart';
import 'package:e_com/features/favorite/data/model/favorite_model.dart';
import 'package:e_com/features/favorite/presentation/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final CatProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 229, 229),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
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
        ),
        //   faviourite icon
        Positioned(
          right: 1,
          child: IconButton(
            onPressed: () async {
              await context.read<FavProvider>().handleFavAddToFirebase(
                FavoriteModel(
                  productId: product.id,
                  createdAt: DateTime.timestamp(),
                  title: product.title,
                  description: product.description,
                  category: product.category,
                  price: product.price,
                  brand: product.brand,
                  rating: product.rating,
                  warrantyInformation: product.warrantyInformation,
                  shippingInformation: product.shippingInformation,
                  images: product.images.first,
                ),
              );
              //
            },
            icon: Icon(Icons.favorite),
          ),
        ),
        Positioned(
          right: 8,
          bottom: 6,
          child: Material(
            color: const Color(0xFF4CAF50),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            elevation: 4,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
