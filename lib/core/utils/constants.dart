import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  // sacffold banner
  static void showNackBar(BuildContext context, String m, Color c) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,

        backgroundColor: c,
        content: Text(m),
      ),
    );
  }
  // firebase init

 static bool get isFirebaseSupported {
  return kIsWeb ||
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}

}
