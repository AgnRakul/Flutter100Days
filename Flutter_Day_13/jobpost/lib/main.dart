// @dart=2.9

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Animation/animation.dart';
import 'Model/job_model.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> jobpost = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/job.json');
    final data = await json.decode(response);

    setState(() {
      jobpost = data['jobs'].map((data) => Job.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 10,
        leadingWidth: 20,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 10),
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
          )
        ],
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              hintText: "Search e.g Flutter Developer",
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: jobpost.length,
          itemBuilder: (context, index) {
            return FadeAnimation(
                (3.0 + index) / 4, jobComponent(job: jobpost[index]));
          }),
    );
  }

  jobComponent({Job job}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(children: [
                  SizedBox(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(job.companyLogo),
                      )),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(job.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(job.address,
                              style: TextStyle(color: Colors.grey[500])),
                        ]),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    job.isMyFav = !job.isMyFav;
                  });
                },
                child: AnimatedContainer(
                  height: 35,
                  padding: EdgeInsets.all(5),
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: job.isMyFav
                            ? Colors.red.shade100
                            : Colors.grey.shade300,
                      )),
                  child: Center(
                    child: job.isMyFav
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.grey.shade600,
                          ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200),
                    child: Text(
                      job.type,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            Color(int.parse("0xff${job.experienceLevelColor}"))
                                .withAlpha(20)),
                    child: Text(
                      job.experienceLevel,
                      style: TextStyle(
                          color: Color(
                              int.parse("0xff${job.experienceLevelColor}"))),
                    ),
                  )
                ],
              ),
              Text(
                job.timeAgo,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
