import 'package:flutter/material.dart';
import 'package:tennis_court/core/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/header-login.png'),
          SafeArea(
            child: Column(
              children: [
                CustomButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                  width: 30,
                ),
                StyledText.headlineLarge('Iniciar sesión'),
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: 70,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
