import 'package:brighthon_test/app/routes/app_pages.dart';
import 'package:brighthon_test/app/shared/widgets/appbar_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/styles/app_colors.dart';
import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MovieController());
    return Scaffold(
      appBar: MyAppBar.fillNav(
        backgroundColor: transparent,
        title: Text(
          'Movie List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                itemBuilder: (context, index) {
                  final movie = controller.movies[index];
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Flexible(
                              flex: 1,
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
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.selectMovieById(
                                              movie.imdbID ?? '');
                                          Get.toNamed(Routes.MOVIE_DETAIL);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          'Details',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(color: primaryColor),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: controller.movies.length,
              ),
      ),
    );
  }
}
