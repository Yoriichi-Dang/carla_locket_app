import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DropdownFriends extends StatefulWidget {
  const DropdownFriends({super.key});

  @override
  State<DropdownFriends> createState() => _DropdownFriendsState();
}

class _DropdownFriendsState extends State<DropdownFriends> {
  bool showList = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showList = !showList;
        });
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 40, 100, 191)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Everyone',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: 'Roboto'),
            ),
            const SizedBox(
              width: 10,
            ),
            showList
                ? SvgPicture.asset('assets/icons/arrow_up.svg')
                : SvgPicture.asset('assets/icons/arrow_down.svg')
          ],
        ),
      ),
    );
  }
}
