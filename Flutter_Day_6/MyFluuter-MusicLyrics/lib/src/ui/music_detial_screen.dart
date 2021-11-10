import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import '../models/lyrics_model.dart';
import 'package:musiclyrics/src/blocs/music_detail_bloc_provider.dart';

class MusicDetails extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final artist;
  // ignore: prefer_typing_uninitialized_variables
  final albumName;
  // ignore: prefer_typing_uninitialized_variables
  final explicit;
  // ignore: prefer_typing_uninitialized_variables
  final rating;
  // ignore: prefer_typing_uninitialized_variables
  final trackid;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  MusicDetails(
      {this.name,
      this.artist,
      this.albumName,
      this.explicit,
      this.rating,
      this.trackid});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return MusicDetailState(
        name: name,
        artist: artist,
        albumName: albumName,
        explicit: explicit,
        rating: rating,
        trackid: trackid);
  }
}

class MusicDetailState extends State<MusicDetails> {
  // ignore: prefer_typing_uninitialized_variables
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final artist;
  // ignore: prefer_typing_uninitialized_variables
  final albumName;
  // ignore: prefer_typing_uninitialized_variables
  final explicit;
  // ignore: prefer_typing_uninitialized_variables
  final rating;
  // ignore: prefer_typing_uninitialized_variables
  final trackid;

  late MusicDetailBloc bloc;

  MusicDetailState(
      {this.name,
      this.artist,
      this.albumName,
      this.explicit,
      this.rating,
      this.trackid});

  @override
  void didChangeDependencies() {
    bloc = MusicDetailBlocProvider.of(context);
    bloc.fetchlyricsById(trackid);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Detials"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Track Name:\n$name",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Artist Name:\n$artist",
                        style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Album Name:\n$albumName",
                        style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    if (explicit == 1)
                      const Text(
                        "Explicits:\n True",
                        style: TextStyle(fontSize: 15),
                      )
                    else
                      const Text(
                        "Explicits:\n False",
                        style: TextStyle(fontSize: 15),
                      )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Rating: $rating",
                        style: const TextStyle(fontSize: 18))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text("Lyrics", style: TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder(
                  stream: bloc.musicLyrics,
                  builder:
                      (context, AsyncSnapshot<Future<LyricsModel>> snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder(
                          future: snapshot.data,
                          builder: (context,
                              AsyncSnapshot<LyricsModel> itemSnapShot) {
                            if (itemSnapShot.hasData) {
                              if (itemSnapShot.data!.message.body.lyrics
                                  .lyricsBody.isNotEmpty) {
                                return lyricsLayout(itemSnapShot.data!);
                              } else {
                                return nolyrics(itemSnapShot.data!);
                              }
                            } else {
                              {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nolyrics(LyricsModel data) {
    return const Center(
      child: Text("No Lyrics available"),
    );
  }

  Widget lyricsLayout(LyricsModel data) {
    if (data.message.body.lyrics.lyricsBody.isNotEmpty) {
      return Row(
        children: <Widget>[
          lyricsItem(data, 0),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          lyricsItem(data, 0),
        ],
      );
    }
  }

  lyricsItem(LyricsModel data, int index) {
    return Flexible(
      child: Column(
        children: <Widget>[
          AutoSizeText(
            data.message.body.lyrics.lyricsBody,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


  

 





/*function lyrics(id) {

final newResponse = await client.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=$_apiKey'));

}
*/