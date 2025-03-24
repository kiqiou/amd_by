import 'package:amdby_shop/components/my_text_field.dart';
import 'package:amdby_shop/screens/home_screen/blocs/product_bloc.dart';
import 'package:amdby_shop/screens/home_screen/views/details_screen.dart';
import 'package:amdby_shop/screens/home_screen/widgets/promo_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  List<Product> productList = [
    Product(id: '1', name: 'Робот-пылесос Xiaomi Robot Vacuum S20+ B108GL', price: 1077.05, rate: 4, countOfReview: 5, image: 'assets/images/first_thing.png'),
    Product(id: '2', name: 'Ноутбук Poraline 40PL52TC-SM', price: 820.50, rate: 4.5, countOfReview: 7, image: 'assets/images/second_thing.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            MyTextField(
                controller: searchController,
                hintText: 'Поиск',
                obscureText: false,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(CupertinoIcons.search),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  } else if (val.length > 30) {
                    return 'Name too long';
                  }
                  return null;
                }),
            SizedBox(height: 10.0),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: productList.length,
                itemBuilder: (context, int index) {
                  final product = productList[index];
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => DetailsScreen(product: product,),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              product.image,
                              fit: BoxFit.cover,
                              height: 165,
                              width: 180,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  Text(
                                    '${product.rate}',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            '(${product.countOfReview})',
                                            style: TextStyle(
                                                color: Colors.grey, fontWeight: FontWeight.w800, fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                                    child: Text(
                                      '${product.price} руб.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                '${product.name}',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_border_sharp),
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_circle_outline),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


