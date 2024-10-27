import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court/core/presentation/landing/home_page.dart';
import 'package:tennis_court/core/presentation/landing/landing_page.dart';
import 'package:tennis_court/core/presentation/landing/login_page.dart';
import 'package:tennis_court/core/presentation/landing/register_page.dart';

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
    path: '/home',
    builder: (context, state) => const HomePage(),
  )
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

  void goToHome() {
    state.go('/home');
  }
}
