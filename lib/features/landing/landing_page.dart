import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Image.asset(
              AppImages.backgroundLanding,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 35),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: Image.asset(AppImages.logo)),
                const Spacer(),
                CustomButton(
                  text: AppStrings.logIn,
                  onPressed: () {
                    context.read<RouterCubit>().goToLogin();
                  },
                ),
                20.h,
                CustomButton(
                  text: AppStrings.signUp,
                  color: AppColors.white.withOpacity(.2),
                  onPressed: () {
                    context.read<RouterCubit>().goToRegister();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
