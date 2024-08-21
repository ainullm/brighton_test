import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import 'custom_navigation.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (controller.currentIndex == 0) {
          return Future.value(false);
        } else {
          controller.changeIndex(0);
          return Future.value(false);
        }
      },
      child: GetBuilder<NavigationController>(
        builder: (_) {
          return Scaffold(
            body: _.listBody.elementAt(_.currentIndex),
            bottomNavigationBar: CustomNavigation(
              currentIndex: _.currentIndex,
              onTap: _.changeIndex,
            ),
          );
        },
      ),
    );
  }
}
