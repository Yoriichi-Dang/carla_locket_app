import 'package:carla_locket_app/configs/routes/app_routes.dart';
import 'package:carla_locket_app/core/layouts/layout.dart';
import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AuthIntroductPage extends StatelessWidget {
  const AuthIntroductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Carla',
              style: const TextStyle(
                fontSize: 80,
                fontFamily: 'Dancing-Script',
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Scan and caption your photos',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade300,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 350,
              margin: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context,
                          AppRoutes.signIn), // Navigate to sign in page
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.secondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context,
                          AppRoutes.signUp), // Navigate to sign up page
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
