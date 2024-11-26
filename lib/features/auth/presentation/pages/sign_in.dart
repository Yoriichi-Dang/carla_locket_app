import 'package:carla_locket_app/configs/routes/app_routes.dart';
import 'package:carla_locket_app/core/layouts/layout.dart';
import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:carla_locket_app/features/auth/presentation/widgets/button.dart';
import 'package:carla_locket_app/features/auth/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            const InputField(
                hint: 'Email',
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                obscure: false),
            const SizedBox(
              height: 30,
            ),
            const InputField(
                hint: 'Passwords',
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                obscure: true),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Button(
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
              backgroundColor: Colors.white,
              textColor: AppColors.secondaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Or sign in with',
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              title: 'Sign In with Google',
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/google_icon.svg',
                width: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto'),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.signUp),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
