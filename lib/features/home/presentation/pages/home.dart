import 'package:carla_locket_app/core/layouts/layout.dart';
import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:carla_locket_app/features/home/presentation/widgets/avatar.dart';
import 'package:carla_locket_app/features/home/presentation/widgets/chat.dart';
import 'package:carla_locket_app/features/home/presentation/widgets/dropdown_friends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Avatar(avatarUrl: 'assets/images/thuong.jpg'),
                  DropdownFriends(),
                  Chat()
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(
                  50,
                ), // Rounded corners for the container
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     bor
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      color: AppColors.accent,
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.accent,
                          width: 3,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .white, // Change this to whatever color you prefer
                        ),
                        width: 75, // Adjust the size of the inner circle
                        height: 75, // Adjust the size of the inner circle
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/scan.svg',
                      color: AppColors.accent,
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
