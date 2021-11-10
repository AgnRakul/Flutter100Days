class LyricsModel {
  LyricsModel(
    this.message,
  );
  late final Message message;

  LyricsModel.fromJson(Map<String, dynamic> json) {
    message = Message.fromJson(json['message']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message.toJson();
    return _data;
  }
}

class Message {
  Message({
    required this.body,
  });

  late final Body body;

  Message.fromJson(Map<String, dynamic> json) {
    body = Body.fromJson(json['body']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['body'] = body.toJson();
    return _data;
  }
}

class Body {
  Body({
    required this.lyrics,
  });
  late final Lyrics lyrics;

  Body.fromJson(Map<String, dynamic> json) {
    lyrics = Lyrics.fromJson(json['lyrics']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lyrics'] = lyrics.toJson();
    return _data;
  }
}

class Lyrics {
  Lyrics({
    required this.lyricsBody,
  });

  late final String lyricsBody;
  Lyrics.fromJson(Map<String, dynamic> json) {
    lyricsBody = json['lyrics_body'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lyrics_body'] = lyricsBody;
    return _data;
  }
}
