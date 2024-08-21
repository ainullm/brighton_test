import 'package:brighthon_test/app/modules/movie/controllers/movie_controller.dart';
import 'package:brighthon_test/app/shared/styles/app_colors.dart';
import 'package:brighthon_test/app/shared/widgets/search_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../../search/controllers/search_controller.dart' as search_controller;

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(MovieController());
    Get.put(search_controller.SearchController());
    final movieController = Get.find<MovieController>();
    final searchController = Get.find<search_controller.SearchController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          children: [
            // Greeting Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Welcome to Movie App',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: primaryColor),
                  ),
                ],
              ),
            ),

            // Carousel Slider
            Obx(() {
              if (controller.popularMovies.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return CarouselSlider.builder(
                  itemCount: controller.popularMovies.length,
                  options: CarouselOptions(
                    height: 300,
                    disableCenter: true,
                    clipBehavior: Clip.none,
                    viewportFraction: 0.95,
                    enlargeCenterPage: true,
                    aspectRatio: 1,
                    autoPlay: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final movie = controller.popularMovies[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(movie.poster ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }
            }),
            const SizedBox(height: 16),

            // Search Widget
            SearchWidget(
              controller: searchController.searchTextEditController,
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
                searchController.fetchMovies();
                Get.toNamed(Routes.SEARCH);
              },
            ),
            const SizedBox(height: 16),

            // Popular Movies Section
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Popular Movies',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: Obx(() {
                      if (controller.popularMovies.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.popularMovies.length,
                          itemBuilder: (context, index) {
                            final movie = controller.popularMovies[index];
                            return GestureDetector(
                              onTap: () {
                                movieController
                                    .selectMovieById(movie.imdbID ?? '');
                                Get.toNamed(Routes.MOVIE_DETAIL);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: NetworkImage(movie.poster ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
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
