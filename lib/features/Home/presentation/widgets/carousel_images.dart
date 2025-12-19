import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatelessWidget {
  const CarouselImages({super.key});

  static const _images = [
    'assets/images/WhatsApp Image 2025-12-18 at 6.27.36 PM.jpeg',
    'assets/images/WhatsApp Image 2025-12-18 at 6.31.16 PM.jpeg',
    'assets/images/WhatsApp Image 2025-12-18 at 6.31.41 PM.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _images.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),

                // subtle gradient overlay (premium look)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.15),
                        Colors.black.withOpacity(0.35),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 0.88,        // side peek
        padEnds: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1100),
        autoPlayCurve: Curves.easeInOutCubic,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.12,
      ),
    );
  }
}
