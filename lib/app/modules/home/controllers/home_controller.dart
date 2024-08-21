import 'package:get/get.dart';
import 'package:brighthon_test/app/core/models/movie_model.dart';

import '../../../core/repositories/movie_repositories.dart';

class HomeController extends GetxController {
  var popularMovies = <MovieModel>[].obs; // RxList untuk menyimpan data film

  @override
  void onInit() {
    super.onInit();
    fetchPopularMovies(); // Panggil fetch data ketika controller diinisialisasi
  }

  void fetchPopularMovies() async {
    try {
      var movies =
          await MovieRepositoriesImpl().getMovies(2); // ambil halaman pertama
      popularMovies.addAll(movies); // simpan hasilnya ke popularMovies
    } catch (e) {
      Get.snackbar('Error', 'Failed to load popular movies');
    }
  }

  
}
