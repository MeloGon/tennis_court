import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/features/widgets/custom_textfield.dart';
import 'package:tennis_court/features/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/header-login.png'),
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
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read<RouterCubit>().goLanding();
                      },
                      width: 30,
                    ),
                    200.h,
                    Text(AppStrings.logIn),
                    Container(
                      height: 1,
                      color: Colors.grey,
                      width: 70,
                    ),
                    60.h,
                    CustomTextfield(
                      label: AppStrings.email,
                      icon: Icon(Icons.email_outlined),
                    ),
                    20.h,
                    CustomTextfield(
                      label: AppStrings.password,
                      icon: Icon(Icons.lock_outline),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true,
                      onChanged: (value) {},
                      title: Text(AppStrings.rememberPassword),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(AppStrings.forgotPassword)),
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
                        Text(AppStrings.dontHaveAccountYet),
                        5.w,
                        Text(
                          AppStrings.signUp,
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
