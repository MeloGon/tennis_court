import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/di/service_locator.dart';
import 'package:tennis_court/features/reserve/data/models/reservation_model.dart';
import 'package:tennis_court/features/reserve/presentation/bloc/reservation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ReservationModelAdapter());
  serviceLocatorInit();
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt<RouterCubit>()),
      BlocProvider(create: (context) => getIt<ReservationBloc>()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterCubit = context.watch<RouterCubit>().state;
    return MaterialApp.router(
      title: 'Tennis Court',
      routerConfig: appRouterCubit,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
