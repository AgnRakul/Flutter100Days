// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eventsapps/animation/fadeanimation.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1498931299472-f7a63a5a1cfa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=873&q=80'),
                    fit: BoxFit.cover),
              ),
              child: Transform.translate(
                offset: Offset(15, -15),
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      shape: BoxShape.circle,
                      color: Colors.yellow[800]),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                1,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                      hintText: "Search Events",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                  1.2,
                  makeItem(
                      image:
                          'https://images.unsplash.com/photo-1498931299472-f7a63a5a1cfa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=873&q=80',
                      date: 17,
                      events: 'Diwali',
                      month: 'SEP',
                      time: '4:30 AM')),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                  1.3,
                  makeItem(
                      image:
                          'https://images.unsplash.com/photo-1631191703520-7fec6e6079d2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
                      date: 18,
                      events: 'Pongal',
                      month: 'NOV',
                      time: '3:00 PM')),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                  1.4,
                  makeItem(
                      image:
                          'https://images.unsplash.com/photo-1489993360877-883980cc7333?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
                      date: 19,
                      events: 'Holi',
                      month: 'DEC',
                      time: '12:00 AM')),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                  1.5,
                  makeItem(
                      image:
                          'https://images.unsplash.com/photo-1608545533444-da0449db4039?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1190&q=80',
                      date: 20,
                      events: 'Christmas Day',
                      month: 'AUG',
                      time: '07:00 AM')),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem(
      {required String image,
      required int date,
      required String events,
      required String month,
      required String time}) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 200,
          margin: EdgeInsets.only(right: 20),
          child: Column(
            children: [
              Text(
                date.toString(),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                month,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    events,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
