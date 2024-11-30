import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/features/widgets/custom_textfield.dart';
import 'package:tennis_court/features/widgets/widgets.dart';

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
                Image.asset('assets/header-login.png'),
                20.h,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.register),
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: 70,
                      ),
                      60.h,
                      CustomTextfield(
                        label: AppStrings.nameAndLastname,
                        icon: Icon(Icons.person_outline),
                      ),
                      20.h,
                      CustomTextfield(
                        label: AppStrings.email,
                        icon: Icon(Icons.email_outlined),
                      ),
                      20.h,
                      CustomTextfield(
                        label: AppStrings.phone,
                        icon: Icon(Icons.phone_android_outlined),
                      ),
                      20.h,
                      CustomTextfield(
                        label: AppStrings.password,
                        icon: Icon(Icons.lock_outline),
                      ),
                      20.h,
                      CustomTextfield(
                        label: AppStrings.confirmPassword,
                        icon: Icon(Icons.lock_outline),
                      ),
                      60.h,
                      CustomButton(
                        text: AppStrings.signUp,
                        onPressed: () {},
                      ),
                      60.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.alreadyHaveAnAccount),
                          5.w,
                          Text(
                            AppStrings.logIn,
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
