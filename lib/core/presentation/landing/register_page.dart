import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/core/widgets/custom_textfield.dart';
import 'package:tennis_court/core/widgets/widgets.dart';

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
                      StyledText.headlineLarge('Registro'),
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: 70,
                      ),
                      60.h,
                      CustomTextfield(
                        label: "Nombre y apellido",
                        icon: Icon(Icons.person_outline),
                      ),
                      20.h,
                      CustomTextfield(
                        label: "Email",
                        icon: Icon(Icons.email_outlined),
                      ),
                      20.h,
                      CustomTextfield(
                        label: "Telefono",
                        icon: Icon(Icons.phone_android_outlined),
                      ),
                      20.h,
                      CustomTextfield(
                        label: "Contraseña",
                        icon: Icon(Icons.lock_outline),
                      ),
                      20.h,
                      CustomTextfield(
                        label: "Confirmar contraseña",
                        icon: Icon(Icons.lock_outline),
                      ),
                      60.h,
                      CustomButton(
                        text: 'Registrarme',
                        onPressed: () {},
                      ),
                      60.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StyledText.bodyLarge('Ya tengo cuenta'),
                          5.w,
                          StyledText.bodyLarge(
                            'Iniciar sesion',
                            color: const Color(0xff346BC3),
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
