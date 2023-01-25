import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PanaromicCarousel extends StatefulWidget {
  const PanaromicCarousel({super.key});

  @override
  State<PanaromicCarousel> createState() => _PanaromicCarouselState();
}

class _PanaromicCarouselState extends State<PanaromicCarousel> {
  late final PageController pageController;
  int pageValue = 0;

  late final Timer carouselTimer;

  Timer getTime() {
    return Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageValue == 4) {
        pageValue = 0;
      }
      pageController.animateToPage(pageValue,
          duration: Duration(seconds: 2), curve: Curves.easeInCirc);

      pageValue++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.5);
    carouselTimer = getTime();
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
      backgroundColor: Colors.black87,
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
              onPageChanged: (index) {
                pageValue = index;
                setState(() {});
              },
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
        SizedBox(
          height: 12,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Icon(
                        Icons.circle,
                        size: 12,
                        color: pageValue == index
                            ? Colors.white
                            : Colors.grey.shade800,
                      ),
                    )))
      ]),
    );
  }
}
