import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/global_widgets/custom_textfield.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.headerLogin),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        context.read<RouterCubit>().goLanding();
                      },
                      width: 30,
                    ),
                    200.h,
                    Text(
                      AppStrings.logIn,
                      style: context.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    5.h,
                    Container(
                      height: 1,
                      color: AppColors.blue346BC3,
                      width: 70,
                    ),
                    60.h,
                    CustomTextfield(
                      label: AppStrings.email,
                      icon: SvgPicture.asset(
                        AppImages.mailIcon,
                      ),
                    ),
                    20.h,
                    CustomTextfield(
                      label: AppStrings.password,
                      icon: SvgPicture.asset(
                        AppImages.lockIcon,
                      ),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true,
                      onChanged: (value) {},
                      title: Text(
                        AppStrings.rememberPassword,
                        style: context.bodyMedium,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.forgotPassword,
                          style: context.bodyLarge?.copyWith(
                              color: AppColors.blue346BC3, letterSpacing: .2),
                        )),
                    40.h,
                    CustomButton(
                      text: AppStrings.logIn,
                      onPressed: () {
                        context.read<RouterCubit>().goToMain();
                      },
                    ),
                    60.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAccountYet,
                          style: context.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400, letterSpacing: .2),
                        ),
                        5.w,
                        Text(
                          AppStrings.signUp,
                          style: context.bodyLarge?.copyWith(
                              color: AppColors.blue346BC3, letterSpacing: .2),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
