import 'package:flutter_app/models/TopAlbums.dart';
import 'package:flutter_app/repository/Repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc {
  final _repository = Repository();
  final _albumsFetcher = PublishSubject<TopAlbums>();

  Stream<TopAlbums> get allAlbums => _albumsFetcher.stream;

  fetchAlbums() async {
    TopAlbums itemModel = await _repository.fetchTopAlbums();
    _albumsFetcher.sink.add(itemModel);
  }

  dispose() {
    _albumsFetcher.close();
  }
}

final bloc = HomeScreenBloc();
