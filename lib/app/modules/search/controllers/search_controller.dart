import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/detail_movie_model.dart';
import '../../../core/models/movie_model.dart';
import '../../../core/repositories/movie_repositories.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var moviesSearch = <MovieModel>[].obs;

  // var searchQuery = ''.obs;
  TextEditingController searchTextEditController = TextEditingController();
  // var searchResults = <DetailMovieModel>[].obs;

  // Timer? debounce;

  void fetchMovies() async {
    try {
      isLoading(true);
      final fetchedMovies = await MovieRepositoriesImpl()
          .getSearchMovies(searchTextEditController.text);
      moviesSearch.addAll(fetchedMovies);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
    searchTextEditController.dispose();
    moviesSearch.clear();
  }
}
