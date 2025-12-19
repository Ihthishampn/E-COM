import 'package:e_com/core/utils/constants.dart';
import 'package:e_com/features/auth/login/presentation/widgets/custom_textfield.dart';
import 'package:e_com/features/auth/login/presentation/widgets/cutom_button.dart';
import 'package:e_com/features/auth/login/presentation/widgets/divider_either.dart';
import 'package:e_com/features/auth/login/presentation/widgets/footer_row_stack.dart';
import 'package:e_com/features/auth/signUp/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void disposeController() {
    nameController.dispose();
    passController.dispose();
    emailController.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    disposeController();
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 25),
          //name
          CustomTextfield(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Username is required';
              }
              return null;
            },
            controller: nameController,
            label: 'User Name',
            hint: 'Enter your username..',
          ),
          const SizedBox(height: 15),
          //email
          CustomTextfield(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Email is required";
              }
              return null;
            },
            controller: emailController,
            label: 'Email Address',
            hint: 'Enter your email..',
          ),

          const SizedBox(height: 15),
          //pass
          CustomTextfield(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            controller: passController,
            label: 'Password',
            hint: 'Enter your password..',
          ),

          const SizedBox(height: 26),
          //button(SignUp)
          Consumer<AuthProvider>(
            builder: (context, provider, child) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (provider.isSuccess) {
                  context.go('/Home');
                  AppConstants.showNackBar(
                    context,
                    'Account created and sign in succesfully',
                    const Color.fromARGB(255, 52, 119, 54),
                  );

                  provider.successreset();
                }

                if (provider.error.isNotEmpty) {
                  AppConstants.showNackBar(context, provider.error, Colors.red);
                  provider.errorReset();
                }
              });
              return provider.isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          provider.handleSignUp(
                            nameController.text.trim(),
                            passController.text.trim(),
                            emailController.text.trim(),
                          );
                        }

                        // logic
                      },
                      size: size,
                      text: 'Sign Up',
                    );
            },
          ),
          const SizedBox(height: 23),

          const DividerEither(),
          //footer(SignIn)
          FooterRowStack(
            ontap: () {
              context.push('/SignIn');
            },
            title: 'Already have an account?',
            buttonName: '  Sign In',
          ),
        ],
      ),
    );
  }
}
