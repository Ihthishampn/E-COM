import 'package:e_com/features/Home/data/model/review_model.dart';

class PopularProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String brand;
  final double rating;
  final String warrantyInformation;
  final String shippingInformation;
  final List<String> images;

  final List<ReviewModel> reviews;

  PopularProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.brand,
    required this.rating,

    required this.warrantyInformation,
    required this.shippingInformation,
    required this.images,

    required this.reviews,
  });

  // fromJson
  factory PopularProductModel.fromJson(Map<String, dynamic> json) {
    return PopularProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num).toDouble(),
      brand: json['brand'] ?? 'Unknown',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      images:
          (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      reviews:
          (json['reviews'] as List?)
              ?.map((e) => ReviewModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
