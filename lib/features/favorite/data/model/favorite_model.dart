import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  final int productId;
  final DateTime createdAt;
  final String title;
  final String description;
  final String category;
  final double price;
  final String brand;
  final double rating;
  final String warrantyInformation;
  final String shippingInformation;
  final String images;
  FavoriteModel({
    required this.productId,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.brand,
    required this.rating,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.images,
  });

  // to json

  Map<String, dynamic> toFirbase() {
    return {
      "productId": productId,
     "createdAt": createdAt,
     "title": title,
     "description": description,
     "category": category,
     "price": price,
     "brand": brand,
     "rating": rating,
     "warrantyInformation": warrantyInformation,
     "shippingInformation": shippingInformation,
     "images": images,
     
     
     };
  }

  // from firebase

  factory FavoriteModel.fromFirebase(Map<String, dynamic> firebase) =>
      FavoriteModel(
        productId: (firebase["productId"] as int),
        createdAt: (firebase["createdAt"] as Timestamp).toDate(),
        title: firebase["title"] ?? "",
        description: firebase["description"] ?? "" ,
        category: firebase["title"] ?? "",
        price: firebase["category"] ?? 0.0 ,
        brand: firebase["brand"] ?? "",
        rating: (firebase["rating"] as num).toDouble() ,
        warrantyInformation: firebase["warrantyInformation"] ?? "" ,
        shippingInformation: firebase["title"] ,
        images: firebase["images"] ?? "" ,
      );
}
