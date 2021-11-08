// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
// @dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moviesprofile/Animation/fadeanimation.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _images = [];
  final List<String> _names = [];

  @override
  void initState() {
    _images
      ..add('assets/images/Ajak.jpg')
      ..add('assets/images/ikaris.jpg')
      ..add('assets/images/sersi.jpg')
      ..add('assets/images/gilgamesh.jpg')
      ..add('assets/images/thena.jpg')
      ..add('assets/images/druig.jpg')
      ..add('assets/images/makkari.jpg')
      ..add('assets/images/kingo.jpg')
      ..add('assets/images/phastos.jpg')
      ..add('assets/images/sprite.jpg');

    _names
      ..add('AJAK')
      ..add('IKARIS')
      ..add('SERSI')
      ..add('GILGAMESH')
      ..add('THENA')
      ..add('DRUIG')
      ..add('MAKKARI')
      ..add('KINGO')
      ..add('PHASTOS')
      ..add('SPRITE');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 600,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Swiper(
                    itemCount: _images.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_images[index]),
                              fit: BoxFit.contain),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(.2),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FadeAnimation(
                                  1,
                                  Text(
                                    'Eternals: ${_names[index]}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    FadeAnimation(
                                      1.2,
                                      Text(
                                        "Action",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    FadeAnimation(
                                      1.3,
                                      Text(
                                        "Director: Chloé Zhao",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    autoplay: true,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeAnimation(
                            1.6,
                            Text(
                              "The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations.",
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.4,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                            1.6,
                            Text(
                              "Released",
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.4,
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            1.6,
                            Text(
                              "5 November 2021",
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.4,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            1.6,
                            Text(
                              "Storyline:",
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.4,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          FadeAnimation(
                            1.6,
                            Text(
                              "Following the events of Avengers: Endgame (2019), an unexpected tragedy forces the Eternals, ancient aliens who have been living on Earth in secret for thousands of years, out of the shadows to reunite against mankind's most ancient enemy, the Deviants.",
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.4,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            1.6,
                            Text(
                              "Trailers and Teaser",
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.4,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            1.8,
                            SizedBox(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  eternalsVideos(
                                      image: 'assets/images/eternals.jpg'),
                                  eternalsVideos(
                                      image: 'assets/images/eternals2.jpg'),
                                  eternalsVideos(
                                      image: 'assets/images/eternals3.jpg'),
                                  eternalsVideos(
                                      image: 'assets/images/eternals4.jpg'),
                                  eternalsVideos(
                                      image: 'assets/images/eternals5.jpg'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FadeAnimation(
                  2,
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow[700],
                      ),
                      child: Align(
                        child: Text(
                          "Watch Now",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
            ),
          )
        ],
      ),
    );
  }

  Widget eternalsVideos({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(.1),
                Colors.white.withOpacity(.1)
              ],
            ),
          ),
          child: Align(
            child: Icon(
              Icons.play_circle_fill_rounded,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
