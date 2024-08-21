import 'package:brighthon_test/app/shared/widgets/appbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/widgets/search_widget.dart';
import '../../movie/controllers/movie_controller.dart';
import '../controllers/search_controller.dart' as search_controller;

class SearchView extends GetView<search_controller.SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<search_controller.SearchController>();
    final movieController = Get.find<MovieController>();

    return Scaffold(
      appBar: MyAppBar.none(
        title: const Text('Search Movie'),
        onTapLeading: () {
          Get.back();
          searchController.searchTextEditController.clear();
          searchController.moviesSearch.clear();
          FocusScope.of(context).unfocus();
        },
      ),
      body: Column(
        children: [
          SearchWidget(
            controller: searchController.searchTextEditController,
            onChanged: (value) {
              searchController.fetchMovies();
            },
          ),
          Obx(() {
            if (searchController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (searchController.moviesSearch.isEmpty) {
              return const Center(child: Text('No results found.'));
            } else {
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: searchController.moviesSearch.length,
                  itemBuilder: (context, index) {
                    final movie = searchController.moviesSearch[index];
                    return GestureDetector(
                      onTap: () {
                        movieController.selectMovieById(movie.imdbID ?? '');
                        Get.toNamed(Routes.MOVIE_DETAIL);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(movie.poster ??
                                      'assets/images/image.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title ?? 'No Title',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    movie.year ?? 'No Year',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
