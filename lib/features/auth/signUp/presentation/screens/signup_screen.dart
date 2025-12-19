import 'package:e_com/core/utils/color_theme.dart';
import 'package:e_com/features/auth/login/presentation/widgets/auth_heading_stack.dart';
import 'package:e_com/features/auth/login/presentation/widgets/white_stack_bg_container.dart';
import 'package:e_com/features/auth/signUp/presentation/widgets/signup_form.dart';
import 'package:e_com/features/auth/widgets/reponsive_stack_builder.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

    static final double _appbaeHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: AppColors.authBgGreen,

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
              backgroundColor: AppColors.authBgGreen,

        toolbarHeight: _appbaeHeight, title: textTitle()),
      body: ResponsiveStackBuilder(
        builder: (w, h) {
          return Stack(
            children: [
              // white stack container
              WhiteStackBgContainer(),
              // auth header
              Positioned(
                top: _appbaeHeight * 0.30,
                left: w * 0.07,
                child: AuthHeadingStack(
                  title: 'Create Account',
                  subtitle: "Create your account to continue",
                ),
              ),

              Positioned(
                top: _appbaeHeight * 0.75,
                left: w * 0.0,
                right: w * 0.0,
                child: SignUpForm(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget textTitle() {
    return Text(
      'Sign Up',
      style: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
