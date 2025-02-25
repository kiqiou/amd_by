import 'package:amdby_shop/components/circular_container.dart';
import 'package:amdby_shop/image/banner_image.dart';
import 'package:amdby_shop/screens/home_screen/widgets/promo_banner.dart';
import 'package:amdby_shop/screens/home_screen/widgets/search_textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.black12,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'amd.by'),
    );
  }
}

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
              MyCustomForm(),
              SizedBox(height: 10.0),
              SizedBox(
                height: 30.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                      ),
                      child: Text(
                        'Акции',
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: PromoBanner(banners: ['assets/images/banners/banner-1.png', 'assets/images/banners/banner-2.png', 'assets/images/banners/banner-3.png'],),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
