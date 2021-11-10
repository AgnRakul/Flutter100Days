import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../models/lyrics_model.dart';
import '../resources/repository.dart';

class MusicDetailBloc {
  final _repository = Repository();
  final _trackId = PublishSubject<int>();
  final _lyrics = BehaviorSubject<Future<LyricsModel>>();

  Function(int) get fetchlyricsById => _trackId.sink.add;
  Stream<Future<LyricsModel>> get musicLyrics => _lyrics.stream;

  MusicDetailBloc() {
    _trackId.stream.transform(_itemTransformer()).pipe(_lyrics);
  }

  dispose() async {
    _trackId.close();
    await _lyrics.drain();
    _lyrics.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
        (Future<LyricsModel> lyrics, int id, int index) {
      // ignore: avoid_print
      print(lyrics);
      lyrics = _repository.fetchlyrics(id);
      return lyrics;
    }, emptyFutureLyricModel());
  }

  Future<LyricsModel> emptyFutureLyricModel() async {
    return LyricsModel(Message(body: Body(lyrics: Lyrics(lyricsBody: "Null"))));
  }
}
