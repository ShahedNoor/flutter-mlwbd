import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class MyCarouselSlider extends StatelessWidget {
  final List userData;

  const MyCarouselSlider({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 170.0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 700),
        showIndicator: true,
        slideIndicator: const CircularSlideIndicator(
          indicatorRadius: 4,
        ),
      ),
      items: userData.isNotEmpty
          ? userData.map((data) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 170,
                          child: Image.network(
                            data['screenshot_two'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          height: 30,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary),
                            child: Center(
                              child: Text(
                                'movie'.toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          left: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title'].length > 35
                                    ? '${data['title'].substring(0, 35)}...'
                                    : data['title'],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                data['release_date'],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList()
          : [const Center(child: CircularProgressIndicator())],
    );
  }
}
