import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _authcheck();
  }

  void _authcheck() async {
    await Future.delayed(Duration(seconds: 1));
    final user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    if (user == null) {
      context.go("/SignIn");
    } else {
      context.go("/Entry");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
