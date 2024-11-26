import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  const Avatar({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap if needed
      },
      child: Container(
        width:
            65, // Size of the avatar container (slightly bigger to accommodate the border)
        height: 65, // Same height as width to maintain circular shape
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Make the container circular
          border: Border.all(
            color: AppColors.accent, // Border color
            width: 2.5, // Border width
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            avatarUrl,
            fit: BoxFit.cover, // Ensure the image fits within the circle
          ),
        ),
      ),
    );
  }
}
