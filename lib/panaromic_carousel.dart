import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paranomic_carousel/panaromic_carousel_indicator.dart';

class ParanomicCarousel extends StatefulWidget {
  const ParanomicCarousel({super.key});

  @override
  State<ParanomicCarousel> createState() => _ParanomicCarouselState();
}

class _ParanomicCarouselState extends State<ParanomicCarousel> {
  late final PageController pageController;
  late final pageValue = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.5);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Paranomic Carousel'),
      // ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 300,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse
            }),
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    return child!;
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    color: Colors.amberAccent,
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ),
        Row(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.circle,
                      size: 10,
                    )))
      ]),
    );
  }
}
