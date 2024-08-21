import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brighthon_test/app/shared/styles/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/widgets/appbar_utils.dart';
import '../../movie/controllers/movie_controller.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.find<MovieController>();

    return Scaffold(
      appBar: MyAppBar.fillNav(
        backgroundColor: transparent,
        title: Text(
          'Favorite Movies',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Obx(() {
        if (controller.favoriteMovies.isEmpty) {
          return const Center(child: Text('No favorite movies found.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.favoriteMovies.length,
          itemBuilder: (context, index) {
            final movie = controller.favoriteMovies[index];
            return GestureDetector(
              onTap: () {
                controller.selectMovieById(movie.imdbID ?? '');
                Get.toNamed(Routes.MOVIE_DETAIL);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              movie.poster ?? 'assets/images/image.png'),
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
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.year ?? 'No Year',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
