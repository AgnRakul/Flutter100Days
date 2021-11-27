// ignore_for_file: unused_field, unnecessary_new, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ProductCard(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  List<dynamic> _products = [
    {
      'title': 'Gmarks - 1270 Blue Sports Skmei Analog-Digital Watch - For Men',
      'image':
          'https://rukminim1.flixcart.com/image/880/1056/ke353m80-0/watch/s/m/i/gmarks-1270-blue-skmei-original-imafuurzyamwnhag.jpeg?q=100',
      'description': 'Limited collection'
    },
    {
      'title': '1243 Black Chronograph Digital Digital Watch - For Men',
      'image':
          'https://rukminim1.flixcart.com/image/880/1056/kumzpu80/watch/m/d/9/1-1243-black-chronograph-digital-skmei-men-original-imaf2d37qgd8xu2h.jpeg?q=50',
      'description': 'Limited collection'
    },
    {
      'title': 'Gmarks - 1270 Blue Sports Skmei Analog-Digital Watch - For Men',
      'image':
          'https://rukminim1.flixcart.com/image/880/1056/kjx6tu80/watch/s/8/u/gmarks-1327-army-skmei-original-imafzdychgpg3jhu.jpeg?q=50',
      'description': 'Limited collection'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      floatingActionButton: _selectedIndex.length > 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.arrow_forward_ios),
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            '@agn.flutter Shop',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
                height: 450.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.70,
                enlargeCenterPage: true,
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: _products.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedIndex == movie) {
                          _selectedIndex = {};
                        } else {
                          _selectedIndex = movie;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: _selectedIndex == movie
                              ? Border.all(
                                  color: Colors.blue.shade500, width: 3)
                              : null,
                          boxShadow: _selectedIndex == movie
                              ? [
                                  BoxShadow(
                                      color: Colors.blue.shade100,
                                      blurRadius: 30,
                                      offset: Offset(0, 10))
                                ]
                              : [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 20,
                                      offset: Offset(0, 5))
                                ]),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 320,
                              margin: EdgeInsets.only(top: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(movie['image'],
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                movie['title'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              movie['description'],
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList()),
      ),
    );
  }
}
