import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/core/Network/dio_client.dart';
import 'package:e_com/features/Home/data/data_source/cat_fetch_data_source.dart';
import 'package:e_com/features/Home/data/data_source/dio_popular_fetch.dart';
import 'package:e_com/features/Home/data/popular_repository_impl/category_repo_impl.dart';
import 'package:e_com/features/Home/data/popular_repository_impl/popular_repo_impl.dart';
import 'package:e_com/features/favorite/data/data_source/fav_data_source.dart';
import 'package:e_com/features/favorite/data/repositoryimpl/fav_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

// di for poppular products
final popularRepo = PopularRepoImpl(DioPopularFetchDataSource(DioClient()));
// di for cat list

final catListrepo = CategoryRepoImpl(CatFetchDataSource(DioClient()));
// di for fav

final favRepo = FavRepositoryImpl(
  FavDataSource(FirebaseFirestore.instance, FirebaseAuth.instance),
);
