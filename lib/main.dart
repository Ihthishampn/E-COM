import 'package:e_com/core/di/di.dart';
import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/core/utils/constants.dart';
import 'package:e_com/features/Entry/presentation/provider/nav_provider.dart';
import 'package:e_com/features/Home/presentation/provider/category_provider.dart';
import 'package:e_com/features/Home/presentation/provider/popular_prodcuts_provider.dart';
import 'package:e_com/features/auth/signUp/data/auth_repository_imp.dart';
import 'package:e_com/features/auth/signUp/presentation/provider/auth_provider.dart';
import 'package:e_com/core/Network/firebase/firebase_options.dart';
import 'package:e_com/features/favorite/presentation/provider/fav_provider.dart';
import 'package:e_com/routes/app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (AppConstants.isFirebaseSupported) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(AuthRepositoryImp()),
        ),
        ChangeNotifierProvider(create: (context) => NavProvider()),
        ChangeNotifierProvider(
          create: (context) => PopularProdcutsProvider(popularRepo),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(catListrepo),
        ),ChangeNotifierProvider(
          create: (context) => FavProvider(favRepo),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.bg),
        scaffoldBackgroundColor: const Color.fromARGB(255, 233, 233, 233),
      ),
      debugShowCheckedModeBanner: false,
      // router
      routerConfig: appRoute,
    );
  }
}
