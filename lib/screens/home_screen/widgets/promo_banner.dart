import 'package:amdby_shop/components/circular_container.dart';
import 'package:amdby_shop/controllers/home_controller.dart';
import 'package:amdby_shop/image/banner_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1, onPageChanged: (index, _) => controller.updatePageIndicator(index)),
            items: banners.map((url) => Padding(padding: EdgeInsets.symmetric(horizontal: 10.0), child: BannerImage(imageUrl: url))).toList()),
        SizedBox(height: 10.0),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i ? Colors.black26 : Colors.black12,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
