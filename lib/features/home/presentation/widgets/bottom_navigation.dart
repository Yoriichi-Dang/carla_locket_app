import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const BottomNavigation(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 75,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(4, 4),
              blurRadius: 30,
            )
          ]),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              backgroundColor: AppColors.secondaryColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/home_icon.svg',
                      width: 20,
                      color: selectedIndex == 0
                          ? Colors.white
                          : Colors.grey.shade600),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/cart_icon.svg',
                      width: 20,
                      color: selectedIndex == 1
                          ? Colors.white
                          : Colors.grey.shade600),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/heart_icon.svg',
                      width: 30,
                      color: selectedIndex == 2
                          ? Colors.white
                          : Colors.grey.shade600),
                  label: 'Love',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/user_icon.svg',
                      width: 23,
                      color: selectedIndex == 3
                          ? Colors.white
                          : Colors.grey.shade600),
                  label: 'Me',
                ),
              ],
              currentIndex: selectedIndex,
              onTap: onItemTapped,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: IconThemeData(size: 24),
              unselectedIconTheme: IconThemeData(size: 24),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
