import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_flutter_app/features/auth/widgets/custom_auth_btn.dart';
import 'package:hungry_flutter_app/features/auth/widgets/custom_text_field.dart';
import 'package:hungry_flutter_app/shared/custom_text.dart';

import '../../../core/constance/app_colors.dart';
import '../../../core/constance/app_images.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(100),
                  SvgPicture.asset(AppImages.logo),

                  Gap(12),
                  CustomText(
                    text: 'Welcome Back, Discover Fast Food.',
                    size: 14,
                    color: AppColors.white,
                    weight: FontWeight.w500,
                  ),

                  Gap(80),
                  CustomTextField(
                    hintText: 'Email',
                    isPassword: false,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),

                  Gap(20),
                  CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                    controller: passController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  Gap(30),
                  CustomAuthBtn(
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('Login');
                      }
                    },
                  ),

                  Gap(20),
                  /// Sign Up text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Don\'t have an account?',
                        size: 14,
                        color: AppColors.white,
                        weight: FontWeight.w500,
                      ),
                      Gap(8),

                      GestureDetector(
                        onTap: (){
                          print('Sign Up');
                        },
                        child: CustomText(
                          text: 'Sign Up',
                          size: 14,
                          color: AppColors.white,
                            decoration: TextDecoration.underline,
                            weight: FontWeight.w700,
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
