import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:suit_up/controllers/asset_manager.dart';

class MainCarouselSlider extends StatelessWidget {
  const MainCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(height: 150),
        items: [1, 2, 3, 4, 5].map((e) {
          return Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AssetManager.cardImage,
                    height: 120,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            },
          );
        }).toList());
  }
}
