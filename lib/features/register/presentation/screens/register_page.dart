import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';

import 'package:tennis_court/global_widgets/custom_textfield.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImages.headerLogin),
                20.h,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.register,
                        style: context.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      5.h,
                      Container(
                        height: 1,
                        color: AppColors.blue346BC3,
                        width: 70,
                      ),
                      40.h,
                      CustomTextfield(
                        hint: AppStrings.nameAndLastname,
                        icon: SvgPicture.asset(
                          AppImages.personIcon,
                        ),
                      ),
                      20.h,
                      CustomTextfield(
                        hint: AppStrings.email,
                        icon: SvgPicture.asset(
                          AppImages.mailIcon,
                        ),
                      ),
                      20.h,
                      CustomTextfield(
                        hint: AppStrings.phone,
                        icon: SvgPicture.asset(
                          AppImages.phoneIcon,
                        ),
                      ),
                      20.h,
                      CustomTextfield(
                        hint: AppStrings.password,
                        icon: SvgPicture.asset(
                          AppImages.lockIcon,
                        ),
                      ),
                      20.h,
                      CustomTextfield(
                        hint: AppStrings.confirmPassword,
                        icon: SvgPicture.asset(
                          AppImages.lockIcon,
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.grey,
                        ),
                      ),
                      40.h,
                      CustomButton(
                        text: AppStrings.signUp,
                        onPressed: () {},
                      ),
                      38.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.alreadyHaveAnAccount,
                            style:
                                context.bodyLarge?.copyWith(letterSpacing: .2),
                          ),
                          5.w,
                          Text(
                            AppStrings.logIn,
                            style: context.bodyLarge?.copyWith(
                                color: AppColors.blue346BC3, letterSpacing: .2),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 40,
            child: CustomButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                context.read<RouterCubit>().goLanding();
              },
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
