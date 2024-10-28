import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court/core/presentation/landing/main_page.dart';
import 'package:tennis_court/core/presentation/landing/landing_page.dart';
import 'package:tennis_court/core/presentation/landing/login_page.dart';
import 'package:tennis_court/core/presentation/landing/register_page.dart';
import 'package:tennis_court/core/presentation/landing/reservation_page.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LandingPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(
    path: '/main',
    builder: (context, state) => MainPage(),
  ),
  GoRoute(
    path: '/reservation',
    builder: (context, state) => const ReservationPage(),
  ),
]);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_publicRouter);

  void goToLogin() {
    state.go('/login');
  }

  void goBack() {
    state.pop();
  }

  void goLanding() {
    state.go('/');
  }

  void goToRegister() {
    state.go('/register');
  }

  void goToMain() {
    state.go('/main');
  }

  void goToReservation() {
    state.go('/reservation');
  }
}
