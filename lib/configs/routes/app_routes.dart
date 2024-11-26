import 'package:carla_locket_app/core/layouts/home_layout.dart';
import 'package:carla_locket_app/features/auth/presentation/pages/auth_introduct.dart';
import 'package:carla_locket_app/features/auth/presentation/pages/sign_in.dart';
import 'package:carla_locket_app/features/auth/presentation/pages/sign_up.dart';
import 'package:carla_locket_app/features/home/presentation/pages/home.dart';
import 'package:carla_locket_app/features/splash/presentation/pages/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String resetPassword = '/reset-password';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String splash = '/splash';
  static const String authIntroduct = '/auth-introduct';
  static const String homeLayout = '/home-layout';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case authIntroduct:
        return MaterialPageRoute(builder: (_) => const AuthIntroductPage());
      // case resetPassword:
      //   return MaterialPageRoute(builder: (_) => const ResetPasswordPage());
      // case profile:
      //   return MaterialPageRoute(builder: (_) => const ProfilePage());
      // case settings:
      //   return MaterialPageRoute(builder: (_) => const SettingsPage());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}
