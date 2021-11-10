class ItemModel {
  late Message message;

  ItemModel({required this.message});

  ItemModel.fromJson(Map<String, dynamic> json) {
    message =
        (json['message'] != null ? Message.fromJson(json['message']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message.toJson();
    return data;
  }
}

class Message {
  late Header header;
  late Body body;

  Message({required this.header, required this.body});

  Message.fromJson(Map<String, dynamic> json) {
    header = (json['header'] != null ? Header.fromJson(json['header']) : null)!;
    body = (json['body'] != null ? Body.fromJson(json['body']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['header'] = header.toJson();
    data['body'] = body.toJson();
    return data;
  }
}

class Header {
  late int statusCode;
  late double executeTime;

  Header({required this.statusCode, required this.executeTime});

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['execute_time'] = executeTime;
    return data;
  }
}

class Body {
  late List<TrackList> trackList;

  Body({required this.trackList});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['track_list'] != null) {
      trackList = <TrackList>[];
      json['track_list'].forEach((v) {
        trackList.add(TrackList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_list'] = trackList.map((v) => v.toJson()).toList();
    return data;
  }
}

class TrackList {
  late Track track;

  TrackList({required this.track});

  TrackList.fromJson(Map<String, dynamic> json) {
    track = (json['track'] != null ? Track.fromJson(json['track']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track'] = track.toJson();
    return data;
  }
}

class Track {
  late int trackId;
  late String trackName;
  late List<void> trackNameTranslationList;
  late int trackRating;
  late int commontrackId;
  late int instrumental;
  late int explicit;
  late int hasLyrics;
  late int hasSubtitles;
  late int hasRichsync;
  late int numFavourite;
  late int albumId;
  late String albumName;
  late int artistId;
  late String artistName;
  late String trackShareUrl;
  late String trackEditUrl;
  late int restricted;
  late String updatedTime;
  late PrimaryGenres primaryGenres;

  Track(
      {required this.trackId,
      required this.trackName,
      required this.trackNameTranslationList,
      required this.trackRating,
      required this.commontrackId,
      required this.instrumental,
      required this.explicit,
      required this.hasLyrics,
      required this.hasSubtitles,
      required this.hasRichsync,
      required this.numFavourite,
      required this.albumId,
      required this.albumName,
      required this.artistId,
      required this.artistName,
      required this.trackShareUrl,
      required this.trackEditUrl,
      required this.restricted,
      required this.updatedTime,
      required this.primaryGenres});

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    if (json['track_name_translation_list'] != null) {
      trackNameTranslationList = <void>[];
      json['track_name_translation_list'].forEach((v) {
        // ignore: void_checks
        trackNameTranslationList.add(v.fromJson(v));
      });
    }
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = (json['primary_genres'] != null
        ? PrimaryGenres.fromJson(json['primary_genres'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['track_name_translation_list'] =
        trackNameTranslationList.map((v) => toJson()).toList();
    data['track_rating'] = trackRating;
    data['commontrack_id'] = commontrackId;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = hasLyrics;
    data['has_subtitles'] = hasSubtitles;
    data['has_richsync'] = hasRichsync;
    data['num_favourite'] = numFavourite;
    data['album_id'] = albumId;
    data['album_name'] = albumName;
    data['artist_id'] = artistId;
    data['artist_name'] = artistName;
    data['track_share_url'] = trackShareUrl;
    data['track_edit_url'] = trackEditUrl;
    data['restricted'] = restricted;
    data['updated_time'] = updatedTime;
    data['primary_genres'] = primaryGenres.toJson();
    return data;
  }
}

class PrimaryGenres {
  late List<MusicGenreList> musicGenreList;

  PrimaryGenres({required this.musicGenreList});

  PrimaryGenres.fromJson(Map<String, dynamic> json) {
    if (json['music_genre_list'] != null) {
      musicGenreList = <MusicGenreList>[];
      json['music_genre_list'].forEach((v) {
        musicGenreList.add(MusicGenreList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre_list'] = musicGenreList.map((v) => v.toJson()).toList();
    return data;
  }
}

class MusicGenreList {
  late MusicGenre musicGenre;

  MusicGenreList({required this.musicGenre});

  MusicGenreList.fromJson(Map<String, dynamic> json) {
    musicGenre = (json['music_genre'] != null
        ? MusicGenre.fromJson(json['music_genre'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre'] = musicGenre.toJson();
    return data;
  }
}

class MusicGenre {
  late int musicGenreId;
  late int musicGenreParentId;
  // ignore: prefer_typing_uninitialized_variables
  late var musicGenreName;
  late String musicGenreNameExtended;
  late String musicGenreVanity;

  MusicGenre(
      {required this.musicGenreId,
      required this.musicGenreParentId,
      required this.musicGenreName,
      required this.musicGenreNameExtended,
      required this.musicGenreVanity});

  MusicGenre.fromJson(Map<String, dynamic> json) {
    musicGenreId = json['music_genre_id'];
    musicGenreParentId = json['music_genre_parent_id'];
    musicGenreName = json['music_genre_name'];
    musicGenreNameExtended = json['music_genre_name_extended'];
    musicGenreVanity = json['music_genre_vanity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre_id'] = musicGenreId;
    data['music_genre_parent_id'] = musicGenreParentId;
    data['music_genre_name'] = musicGenreName;
    data['music_genre_name_extended'] = musicGenreNameExtended;
    data['music_genre_vanity'] = musicGenreVanity;
    return data;
  }
}
