import 'package:brighthon_test/app/modules/favorites/views/favorites_view.dart';
import 'package:brighthon_test/app/modules/home/views/home_view.dart';
import 'package:brighthon_test/app/modules/movie/views/movie_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0;

  List<Widget> listBody = [
    const HomeView(),
    const MovieView(),
    const FavoritesView(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
