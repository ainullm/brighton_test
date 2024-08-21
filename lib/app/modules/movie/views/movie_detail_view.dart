import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brighthon_test/app/shared/styles/app_colors.dart';
import '../../../shared/widgets/appbar_utils.dart';
import '../controllers/movie_controller.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.find<MovieController>();

    return Scaffold(
      appBar: MyAppBar.none(
        backgroundColor: transparent,
        title: Text(
          'Movie Detail',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final movie = controller.selectedMovie.value;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image:
                        NetworkImage(movie.poster ?? 'assets/images/image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Title Movie
              Text(
                movie.title ?? 'No Title',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Rating: ${movie.imdbRating ?? 'No Rating'}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Year: ${movie.year ?? 'No Year'}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              Text(
                movie.plot ?? 'No Plot available',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              Obx(() => ElevatedButton.icon(
                    onPressed: controller.toggleFavorite,
                    icon: Icon(
                      controller.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isFavorite.value ? red : white,
                    ),
                    label: Text(
                      controller.isFavorite.value ? 'Unfavorite' : 'Favorite',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  )),
            ],
          ),
        );
      }),
    );
  }
}
