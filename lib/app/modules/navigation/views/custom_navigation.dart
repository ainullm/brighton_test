import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/app_colors.dart';
import '../../../shared/utils/images_utils.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomAppBar(
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          backgroundColor: white,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          unselectedItemColor: grey,
          selectedItemColor: primaryColor,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: AppImage.svg(
                currentIndex == 0 ? 'ic-nav-home-on' : 'ic-nav-home',
                color: currentIndex == 0 ? primaryColor : grey,
                fit: BoxFit.contain,
                width: 25,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: AppImage.svg(
                currentIndex == 1 ? 'ic-nav-movie-on' : 'ic-nav-movie',
                color: currentIndex == 1 ? primaryColor : grey,
                fit: BoxFit.contain,
                width: 25,
              ),
              label: 'Movie',
            ),
            BottomNavigationBarItem(
              icon: AppImage.svg(
                currentIndex == 2 ? 'ic-nav-love-on' : 'ic-nav-love',
                color: currentIndex == 2 ? primaryColor : grey,
                fit: BoxFit.contain,
                width: 25,
              ),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }
}
