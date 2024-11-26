import 'package:carla_locket_app/configs/routes/app_routes.dart';
import 'package:carla_locket_app/core/layouts/layout.dart';
import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
            context, AppRoutes.authIntroduct); // if user not login
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Layout(
      child: Center(
        child: Text(
          'Carla',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 100,
            fontWeight: FontWeight.w600,
            fontFamily: 'Dancing-Script',
          ),
        ),
      ),
    );
  }
}
