import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap if needed
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width:
            50, // Size of the avatar container (slightly bigger to accommodate the border)
        height: 50, // Same height as width to maintain circular shape
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          shape: BoxShape.circle, // Make the container circular
          border: Border.all(
            color: AppColors.accent, // Border color
            width: 2.5, // Border width
          ),
        ),
        child: SvgPicture.asset(
          'assets/icons/chat.svg',
          color: AppColors.accent,
        ),
      ),
    );
  }
}
