import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:musiclyrics/src/models/lyrics_model.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MusicApiProvider {
  Client client = Client();
  final _apiKey = '6fd645f00240206f9c14dea1188c474b';

  Future<ItemModel> fetchMusicList() async {
    final response = await client.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$_apiKey'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw ('Failed to load post');
    }
  }

  Future<LyricsModel> fetchlyric(int trackId) async {
    final newResponse = await client.get(Uri.parse(
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=6fd645f00240206f9c14dea1188c474b"));

    if (newResponse.statusCode == 200) {
      return LyricsModel.fromJson(json.decode(newResponse.body));
    } else {
      throw ('Failed to load trailers');
    }
  }
}
