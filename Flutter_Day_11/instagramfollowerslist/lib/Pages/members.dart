// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:instagramfollowerslist/models/followers_model.dart';

class MembersPage extends StatefulWidget {
  MembersPage({Key? key}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage>
    with TickerProviderStateMixin {
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

  final List<Followers> _selectedFollowers = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> selectedListKey =
      GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Add Members',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 20, left: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text("Selected Members"),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: AnimatedList(
                      scrollDirection: Axis.horizontal,
                      key: selectedListKey,
                      initialItemCount: _selectedFollowers.length,
                      itemBuilder: (context, index, animation) {
                        return selectedFollowersComponent(
                            user: _selectedFollowers[index],
                            index: index,
                            animation: animation);
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: AnimatedList(
                    key: listKey,
                    initialItemCount: _followers.length,
                    itemBuilder: (context, index, animation) {
                      return followersComponent(
                          user: _followers[index],
                          index: index,
                          animation: animation);
                    }))
          ],
        ),
      ),
    );
  }

  selectedFollowersComponent({required Followers user, index, animation}) {
    return FadeTransition(
      opacity: animation,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(user.images),
            ),
          ),
          Positioned(
            top: 0,
            right: 15,
            child: GestureDetector(
              onTap: () {
                listKey.currentState?.insertItem(_followers.length,
                    duration: Duration(milliseconds: 500));
                selectedListKey.currentState?.removeItem(
                  index,
                  (context, animation) => selectedFollowersComponent(
                      user: user, index: index, animation: animation),
                  duration: Duration(milliseconds: 300),
                );
                _selectedFollowers.remove(user);
                _followers.add(user);
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    shape: BoxShape.circle,
                    color: Colors.grey[200]),
                child: Center(
                  child: Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget followersComponent({required Followers user, index, animation}) {
    return GestureDetector(
      onTap: () => {
        setState(
          () {
            if (_selectedFollowers.length >= 5) return;

            listKey.currentState?.removeItem(
                index,
                (context, animation) => followersComponent(
                    user: user, index: index, animation: animation),
                duration: Duration(milliseconds: 300));
            selectedListKey.currentState?.insertItem(_selectedFollowers.length,
                duration: Duration(milliseconds: 500));
            _selectedFollowers.add(user);
            _followers.remove(user);
          },
        )
      },
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(user.images),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.username,
                          style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
