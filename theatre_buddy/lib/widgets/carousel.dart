import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:theatre_buddy/models/caro_model.dart';

class Carousel extends StatelessWidget {
  final List<CaroImage> contents = [
    CaroImage(content: '1', img: 'images/quotes2.png'),
    CaroImage(content: '2', img: 'images/quotes1.png'),
    CaroImage(content: '3', img: 'images/drama.png'),
    CaroImage(content: '4', img: 'images/quotes4.png'),
  ];

  Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: contents.length,
        itemBuilder: (BuildContext context, i, pageViewIndex) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Card(
              color: Colors.blue,
              child: Center(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(contents[i].img), fit: BoxFit.cover)),
              )),
            ),
          );
        },
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.25,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlay: true,
            aspectRatio: 3 / 2,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3)));
  }
}
