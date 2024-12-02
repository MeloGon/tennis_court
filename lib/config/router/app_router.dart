import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court/features/landing/main_page.dart';
import 'package:tennis_court/features/landing/landing_page.dart';
import 'package:tennis_court/features/landing/login_page.dart';
import 'package:tennis_court/features/landing/register_page.dart';
import 'package:tennis_court/features/reserve/presentation/screens/reservation_page.dart';

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
    state.push('/login');
  }

  void goBack() {
    state.pop();
  }

  void goLanding() {
    state.push('/');
  }

  void goToRegister() {
    state.push('/register');
  }

  void goToMain() {
    state.push('/main');
  }

  void goToReservation() {
    state.push('/reservation');
  }
}
