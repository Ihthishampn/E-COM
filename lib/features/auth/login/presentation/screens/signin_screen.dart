import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/auth/login/presentation/widgets/auth_heading_stack.dart';
import 'package:e_com/features/auth/login/presentation/widgets/signin_form.dart';
import 'package:e_com/features/auth/login/presentation/widgets/white_stack_bg_container.dart';
import 'package:e_com/features/auth/widgets/reponsive_stack_builder.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const double _appbaeHeight = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBgGreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        toolbarHeight: _appbaeHeight,
        backgroundColor: AppColors.authBgGreen,
        title: textTitle(),
      ),
      body: ResponsiveStackBuilder(
        builder: (w, h) {
          return Stack(
            children: [
              //  stack bg container
              WhiteStackBgContainer(),
              // title and subtitle text
              Positioned(
                top: _appbaeHeight * 0.30,
                left: w * 0.07,
                child: AuthHeadingStack(
                  title: 'Welcome Back!',
                  subtitle:
                      "To  keep connected with us please login with your \npersonal info",
                ),
              ),
              //  email , pass, signIn  button,
              Positioned.fill(
                top: _appbaeHeight * 0.75,
                left: w * 0.0,
                right: w * 0.0,
                child: SingleChildScrollView(child: SignInForm()),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget textTitle() {
    return Text(
      'Sign In',
      style: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
