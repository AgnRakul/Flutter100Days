// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:instagramfollowerslist/models/followers_model.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    with TickerProviderStateMixin {
  final List<Followers> _selectedUsers = [];

  final List<Followers> _followers = [
    Followers(
        'Hüseyin Topcu',
        'Hüseyin_Topcu',
        'https://images.unsplash.com/photo-1623583043462-3a0d4ccaf902?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80',
        false),
    Followers(
        'Filipp Romanovski',
        'Filipp_Romanovski',
        'https://images.unsplash.com/photo-1517336277864-8c02f49ef022?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80',
        true),
    Followers(
        'Jamar Crable',
        'Jamar_Crable',
        'https://images.unsplash.com/photo-1619752415757-83bf8b6fcf0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=586&q=80',
        false),
    Followers(
        'Haryo Setyadi',
        'Haryo_Setyadi',
        'https://images.unsplash.com/photo-1627541718143-1adc1b582e62?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80',
        true),
    Followers(
        'Duong Thinh',
        'Duong_Thinh',
        'https://images.unsplash.com/photo-1624283361560-97660aabb2f3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80',
        false),
    Followers(
        'Gemma Chua-Tran',
        'Gemma_Chua-Tran',
        'https://images.unsplash.com/photo-1574279606130-09958dc756f7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80',
        true),
    Followers(
        'Frank Uyt den Bogaard',
        'Frank',
        'https://images.unsplash.com/photo-1525430182374-bf7e61d4f220?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=540&q=80',
        false),
    Followers(
        'Michael Afonso',
        'Michael_Afonso',
        'https://images.unsplash.com/photo-1515463892140-58a22e37ff72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=603&q=80',
        true),
    Followers(
        'Alonso Reyes',
        'Alonso_Reyes',
        'https://images.unsplash.com/photo-1567622178710-75175658e313?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80',
        false),
    Followers(
        'Clem Onojeghuo',
        'Clem_Onojeghuo',
        'https://images.unsplash.com/photo-1470784694193-00f44d7b9374?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80',
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Following',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            itemCount: _followers.length,
            itemBuilder: (context, index) {
              return userComponent(user: _followers[index]);
            },
          )),
    );
  }

  userComponent({required Followers user}) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user.images),
                )),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.username,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 5,
              ),
              Text(user.name,
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.bold)),
            ])
          ]),
          Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffeeeeee)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: MaterialButton(
                elevation: 0,
                color: user.isFollowing
                    ? const Color(0xff98FB98)
                    : const Color(0xffFF6347),
                onPressed: () {
                  setState(() {
                    user.isFollowing = !user.isFollowing;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(user.isFollowing ? 'Follow' : 'Remove',
                    style: const TextStyle(color: Colors.black)),
              ))
        ],
      ),
    );
  }
}
