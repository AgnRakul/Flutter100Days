import 'dart:async';
import 'music_api_provider.dart';
import '../models/item_model.dart';
import '../models/lyrics_model.dart';

class Repository {
  final musicApiProvider = MusicApiProvider();

  Future<ItemModel> fetchAllMusic() => musicApiProvider.fetchMusicList();

  Future<LyricsModel> fetchlyrics(int trackId) =>
      musicApiProvider.fetchlyric(trackId);
}
