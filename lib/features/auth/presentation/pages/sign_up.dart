import 'package:carla_locket_app/configs/routes/app_routes.dart';
import 'package:carla_locket_app/core/layouts/layout.dart';
import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:carla_locket_app/features/auth/presentation/widgets/button.dart';
import 'package:carla_locket_app/features/auth/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                'Let\'s Get Started',
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
                  typeKeyboard: 'email',
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  obscure: false),
              const SizedBox(
                height: 30,
              ),
              const InputField(
                  hint: 'Phone',
                  icon: Icon(
                    Icons.phone,
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
                height: 30,
              ),
              const InputField(
                  hint: 'Confirm Password',
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  obscure: true),
              const SizedBox(
                height: 40,
              ),
              Button(
                title: 'Sign Up',
                onPressed: () {},
                backgroundColor: Colors.white,
                textColor: AppColors.secondaryColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto'),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signIn),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
