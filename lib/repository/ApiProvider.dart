import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/models/TopAlbums.dart';
import 'package:http/http.dart' show Client, Response;

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://itunes.apple.com/us/rss/topalbums/limit=100/json";

  Future<TopAlbums> fetchMovieList() async {
    Response response = await client.get("$_baseUrl");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TopAlbums.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}