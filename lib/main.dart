import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'image/banner_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 30.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                      ),
                      items: [
                        RoundedImage(imageUrl: 'assets/images/banners/banner-1.png'),
                        RoundedImage(imageUrl: 'assets/images/banners/banner-2.png'),
                        RoundedImage(imageUrl: 'assets/images/banners/banner-3.png')
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  //late TextEditingController _searchingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Поиск товаров',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
