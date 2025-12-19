import 'package:e_com/core/utils/constants.dart';
import 'package:e_com/features/auth/login/presentation/widgets/custom_textfield.dart';
import 'package:e_com/features/auth/login/presentation/widgets/cutom_button.dart';
import 'package:e_com/features/auth/login/presentation/widgets/cutom_forgetpass_row.dart';
import 'package:e_com/features/auth/login/presentation/widgets/divider_either.dart';
import 'package:e_com/features/auth/login/presentation/widgets/footer_row_stack.dart';
import 'package:e_com/features/auth/signUp/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void disposeController() {
    passController.dispose();
    emailController.dispose();
  }

  @override
  void dispose() {
    disposeController();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 42),
          // name
          CustomTextfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }
              return null;
            },
            controller: emailController,
            hint: 'Enter your email here..',
            label: 'Email Address',
          ),
          const SizedBox(height: 17),
          // pass
          CustomTextfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "password is required";
              }
              return null;
            },
            controller: passController,
            hint: 'Enter your password here',
            label: 'Password',
            obst: true,
          ),
          const SizedBox(height: 20),

          // forget pass
          CustomForgetpassRow(),

          const SizedBox(height: 22),

          // Sign In buton
          Consumer<AuthProvider>(
            builder: (context, provider, child) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (provider.error.isNotEmpty) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  AppConstants.showNackBar(context, provider.error, Colors.red);
                  provider.errorReset();
                }

                if (provider.isSuccess) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  AppConstants.showNackBar(
                    context,
                    "Signed in successfully",
                    Colors.green,
                  );
                  provider.successreset();
                  context.go('/Home');
                }
              });
              return provider.isLoading ? CircularProgressIndicator() : CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    provider.handleSignIn(
                      emailController.text.trim(),
                      passController.text.trim(),
                    );
                  }
                },
                size: size,
                text: 'Sign In',
              );
            },
          ),
          const SizedBox(height: 27),

          //footer text
          DividerEither(),
          const SizedBox(height: 24),
          // footer row new here?
          FooterRowStack(
            ontap: () {
              context.pop('/signUp');
            },
            title: 'New here?',
            buttonName: "  Create an account",
          ),
        ],
      ),
    );
  }
}
