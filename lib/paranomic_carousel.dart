import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ParanomicCarousel extends StatefulWidget {
  const ParanomicCarousel({super.key});

  @override
  State<ParanomicCarousel> createState() => _ParanomicCarouselState();
}

class _ParanomicCarouselState extends State<ParanomicCarousel> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
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
      body: Column(children: [
        SizedBox(
          height: 200,
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
                    margin: EdgeInsets.only(top: 20, left: 8, right: 8),
                    color: Colors.amberAccent,
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        )
      ]),
    );
  }
}
