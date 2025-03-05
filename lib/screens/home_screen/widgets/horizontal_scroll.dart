import 'package:amdby_shop/components/rounded_image.dart';
import 'package:flutter/material.dart';

class HorizontalScroll extends StatelessWidget {
  HorizontalScroll({
    super.key,
    this.width = 50.0,
    this.height = 30.0,
    this.padding = 30.0,
    this.borderRadius = 25.0,
  });

  double width;
  double height;
  double padding;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            width: 120.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(
                'Акции',
                style: TextTheme.of(context).labelSmall,
              ),
            ]),
          );
        },
      ),
    );
  }
}

class HorizontalScrollWithImage extends HorizontalScroll {
  HorizontalScrollWithImage({
    super.key,
    this.width = 120.0,
    this.height = 150.0,
    this.padding = 30.0,
    this.borderRadius = 10.0,
  });

  double width;
  double height;
  double padding;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            width: 120.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              RoundedImage(
                imageUrl: 'assets/images/banners/banner-2.png',
                width: 30,
                height: 30,
                borderRadius: 2.0,
              ),
              Text(
                'Акции',
                style: TextTheme.of(context).labelSmall,
              ),
            ]),
          );
        },
      ),
    );
  }
}
