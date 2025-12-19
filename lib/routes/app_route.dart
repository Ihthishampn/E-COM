import 'package:e_com/features/Entry/presentation/screens/entry_screen.dart';
import 'package:e_com/features/Home/presentation/screens/home_screen.dart';
import 'package:e_com/features/Splash/presentation/screens/splash_screen.dart';
import 'package:e_com/features/auth/login/presentation/screens/signin_screen.dart';
import 'package:e_com/features/auth/signUp/presentation/screens/signup_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoute = GoRouter(
  initialLocation: '/Splash',

  routes: [
    GoRoute(
      path: '/SignIn',
      pageBuilder: (context, state) => NoTransitionPage(child: SignInScreen()),
    ),
    GoRoute(
      path: '/signUp',
      pageBuilder: (context, state) => NoTransitionPage(child: SignupScreen()),
    ),
    GoRoute(path: '/Home',pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),),
    GoRoute(path: '/Splash',pageBuilder: (context, state) => NoTransitionPage(child: SplashScreen()),),
    GoRoute(path: '/Entry',pageBuilder: (context, state) => NoTransitionPage(child: EntryScreen()),)
  ],
);
