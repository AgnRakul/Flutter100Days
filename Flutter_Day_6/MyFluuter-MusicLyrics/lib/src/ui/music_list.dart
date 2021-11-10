import 'package:flutter/material.dart';
import 'package:musiclyrics/src/blocs/music_detail_bloc_provider.dart';
import '../models/item_model.dart';

import '../blocs/music_bloc.dart';
import 'music_detial_screen.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMusic();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMusic();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Music'),
      ),
      body: StreamBuilder(
        stream: bloc.allMusic,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: Text("No Internet Connection"));
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.message.body.trackList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            child: Card(
              child: ListTile(
                title: Text(snapshot
                    .data!.message.body.trackList[index].track.trackName),
                subtitle: Text(snapshot
                    .data!.message.body.trackList[index].track.albumName),
                trailing: Column(
                  children: [
                    Text(
                      "Rating: ${snapshot.data!.message.body.trackList[index].track.trackRating.toString()}",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return MusicDetailBlocProvider(
                      child: MusicDetails(
                    name: snapshot
                        .data!.message.body.trackList[index].track.trackName,
                    artist: snapshot
                        .data!.message.body.trackList[index].track.artistName,
                    albumName: snapshot
                        .data!.message.body.trackList[index].track.albumName,
                    explicit: snapshot
                        .data!.message.body.trackList[index].track.explicit,
                    rating: snapshot
                        .data!.message.body.trackList[index].track.trackRating
                        .toString(),
                    trackid: snapshot
                        .data!.message.body.trackList[index].track.trackId,
                  ));
                }),
              );
            });
      },
    );
  }
}
