import 'dart:convert';

import 'package:brighthon_test/app/core/constant/constants.dart';
import 'package:brighthon_test/app/core/constant/endpoints.dart';
import 'package:brighthon_test/app/core/models/detail_movie_model.dart';
import 'package:brighthon_test/app/core/models/movie_model.dart';
import 'package:brighthon_test/app/core/services/dio_client.dart';
import 'package:dio/dio.dart' hide Response;

abstract class MovieRepository {
  Future<List<MovieModel>> getMovies(int page);
  Future<List<MovieModel>> getAllMovies(int totalMovies);
  Future<DetailMovieModel> getDetailMovie(String id);
}

class MovieRepositoriesImpl extends MovieRepository {
  MovieRepositoriesImpl() : dioClient = DioClient(API_BASE_URL);
  DioClient dioClient;

  @override
  Future<List<MovieModel>> getMovies(int page) async {
    final response = await dioClient
        .create()
        .get(Endpoint.getDataMovie.replaceAll('pageNumber', page.toString()));
    if (response.statusCode == 200) {
      final List<MovieModel> movies = [];
      for (var item in response.data['Search']) {
        movies.add(MovieModel.fromJson(item));
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<MovieModel>> getAllMovies(int totalMovies) async {
    List<MovieModel> allMovies = [];
    int page = 1;

    while (allMovies.length < totalMovies) {
      List<MovieModel> movies = await getMovies(page);
      allMovies.addAll(movies);
      page++;
    }

    return allMovies;
  }

  @override
  Future<DetailMovieModel> getDetailMovie(String id) async {
    final response = await dioClient.create().get(Endpoint.getDetailMovie + id);
    if (response.statusCode == 200) {
      return DetailMovieModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load detail movie');
    }
  }

  Future<List<MovieModel>> getSearchMovies(String name) async {
    final response =
        await dioClient.create().get(Endpoint.getSearchMovie + name);
    if (response.statusCode == 200) {
      final List<MovieModel> movies = [];
      for (var item in response.data['Search']) {
        movies.add(MovieModel.fromJson(item));
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
