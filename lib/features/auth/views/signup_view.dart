import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constance/app_colors.dart';
import '../../../core/constance/app_images.dart';
import '../../../shared/custom_text.dart';
import '../widgets/custom_auth_btn.dart';
import '../widgets/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    return  GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(100),
                  SvgPicture.asset(AppImages.logo),

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
                    hintText: 'Name',
                    isPassword: false,
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
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

                  Gap(20),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    isPassword: true,
                    controller: confirmPassController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  Gap(30),
                  CustomAuthBtn(
                    text: 'Sign up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('Sign up button pressed');
                      }
                    },
                  ),

                  Gap(20),

                  // /// Sign Up text
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CustomText(
                  //       text: 'Don\'t have an account?',
                  //       size: 14,
                  //       color: AppColors.white,
                  //       weight: FontWeight.w500,
                  //     ),
                  //     Gap(8),
                  //
                  //     GestureDetector(
                  //       onTap: () {
                  //         print('Sign Up');
                  //       },
                  //       child: CustomText(
                  //         text: 'Sign Up',
                  //         size: 14,
                  //         color: AppColors.white,
                  //         decoration: TextDecoration.underline,
                  //         weight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
