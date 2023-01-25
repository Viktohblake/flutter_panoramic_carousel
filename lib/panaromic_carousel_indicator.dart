import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PanaromicCarouselIndicator extends StatefulWidget {
  const PanaromicCarouselIndicator({super.key});

  @override
  State<PanaromicCarouselIndicator> createState() =>
      _PanaromicCarouselIndicatorState();
}

class _PanaromicCarouselIndicatorState
    extends State<PanaromicCarouselIndicator> {
  late final pageValue;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            5,
            (index) => Icon(
                  Icons.circle,
                  size: 10,
                  color: pageValue,
                )));
  }
}
