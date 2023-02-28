import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:suit_up/controllers/asset_manager.dart';

class MainCarouselSlider extends StatelessWidget {
  const MainCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/s1.jpg',
      'assets/images/s2.jpg',
      'assets/images/s3.jpg',
      'assets/images/s4.jpg',
      'assets/images/s5.jpg',
    ];
    return CarouselSlider(
        options: CarouselOptions(
          height: 160,
          autoPlay: true,
        ),
        items: [0, 1, 2, 3, 4].map((index) {
          return Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(8),
                child: Card(
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      images[index],
                      height: 140,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList());
  }
}
