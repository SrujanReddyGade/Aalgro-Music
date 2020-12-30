import 'dart:async';

import 'package:flutter_app/models/TopAlbums.dart';
import 'package:flutter_app/repository/ApiProvider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<TopAlbums> fetchTopAlbums() => apiProvider.fetchMovieList();
}