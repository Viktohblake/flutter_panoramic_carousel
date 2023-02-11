import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';

class PanaromicCarousel extends StatefulWidget {
  const PanaromicCarousel({super.key});

  @override
  State<PanaromicCarousel> createState() => _PanaromicCarouselState();
}

class _PanaromicCarouselState extends State<PanaromicCarousel> {
  List<String> imageList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg'
  ];

  late final LoopPageController pageController;
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
    pageController = LoopPageController(
        initialPage: 0, viewportFraction: 0.3, keepPage: true);
    // carouselTimer = getTime();
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
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Paranomic Carousel'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse
              }),
              child: LoopPageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  pageValue = index;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  var rotationValue = 29.0;
                  if (index == 0) {
                    rotationValue = 29.0;
                  } else if (index == imageList.length - 1) {
                    rotationValue = 29.0;
                  } else if (index == pageValue) {
                    rotationValue = 0;
                  }
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(rotationValue),
                    alignment: FractionalOffset.center,
                    child: Container(
                        height: 200,
                        width: 200,
                        margin: EdgeInsets.only(left: 8, right: 8),
                        child:
                            Image.asset(fit: BoxFit.cover, imageList[index])),
                  );
                },
                itemCount: imageList.length,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  imageList.length,
                  (index) => Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: pageValue == index
                              ? Colors.blue
                              : Colors.grey.shade800,
                        ),
                      )))
        ],
      ),
    );
  }
}
