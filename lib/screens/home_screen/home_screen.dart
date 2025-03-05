import 'package:amdby_shop/screens/home_screen/widgets/horizontal_scroll.dart';
import 'package:amdby_shop/screens/home_screen/widgets/promo_banner.dart';
import 'package:amdby_shop/screens/home_screen/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              SearchTextField(),
              SizedBox(height: 10.0),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              HorizontalScroll(),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: PromoBanner(
                  banners: [
                    'assets/images/banners/banner-1.png',
                    'assets/images/banners/banner-2.png',
                    'assets/images/banners/banner-3.png'
                  ],
                ),
              ),
              HorizontalScrollWithImage(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

