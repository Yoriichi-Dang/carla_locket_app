import 'package:carla_locket_app/configs/routes/app_routes.dart';
import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carla Locket App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      initialRoute: AppRoutes.splash, // Set the initial route
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
