import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/core/widgets/widgets.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/bg-landing.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 35),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: Image.asset('assets/logo.png')),
                const Spacer(),
                CustomButton(
                  text: 'Iniciar Sesion',
                  onPressed: () {},
                ),
                20.h,
                CustomButton(
                  text: 'Registrarme',
                  color: Colors.white.withOpacity(.2),
                  onPressed: () {
                    context.read<RouterCubit>().goToLogin();
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
