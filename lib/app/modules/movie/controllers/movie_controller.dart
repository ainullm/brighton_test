import 'package:brighthon_test/app/core/models/detail_movie_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/models/movie_model.dart';
import '../../../core/repositories/movie_repositories.dart';

class MovieController extends GetxController {
  var movies = <MovieModel>[].obs;
  var isLoading = false.obs;
  // var selectedMovie = MovieModel().obs;
  var selectedMovie = DetailMovieModel().obs;
  var isFavorite = false.obs;
  final box = GetStorage();
  var favoriteMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      final fetchedMovies = await MovieRepositoriesImpl().getAllMovies(30);
      movies.addAll(fetchedMovies);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void selectMovieById(String id) async {
    try {
      isLoading(true);
      var movieDetail = await MovieRepositoriesImpl().getDetailMovie(id);
      selectedMovie(movieDetail);
      isFavorite(false); // Reset favorit saat movie dipilih
    } finally {
      isLoading(false);
    }
  }

  void toggleFavorite() {
    isFavorite(!isFavorite.value);
    if (isFavorite.value) {
      box.write(selectedMovie.value.imdbID!, true);
      favoriteMovies.add(MovieModel(
        imdbID: selectedMovie.value.imdbID,
        title: selectedMovie.value.title,
        year: selectedMovie.value.year,
        poster: selectedMovie.value.poster,
      ));
    } else {
      box.remove(selectedMovie.value.imdbID!);
      favoriteMovies.remove(
        favoriteMovies
            .firstWhere((m) => m.imdbID == selectedMovie.value.imdbID),
      );
    }
  }

  void loadFavoriteMovies() {
    final keys = box.getKeys();
    favoriteMovies.clear();
    for (var key in keys) {
      final movie = movies.firstWhereOrNull((m) => m.imdbID == key);
      if (movie != null) {
        favoriteMovies.add(movie);
      }
    }
  }
}
