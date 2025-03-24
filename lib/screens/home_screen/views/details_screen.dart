import 'package:amdby_shop/components/row_with_icon.dart';
import 'package:amdby_shop/screens/home_screen/blocs/product_bloc.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 20.0;
    const double spaceBetween = 20.0;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - (40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                image: DecorationImage(
                  image: AssetImage(product.image),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            'Код: 3228686',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'В наличии',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    RowWithIcon(
                      icon: Icons.add_alert_sharp,
                      text: "Узнать о снижении цены",
                      color: Colors.blueAccent,
                      onTap: () {
                        print("Нажатие");
                      },
                    ),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    RowWithIcon(icon: Icons.compare_arrows, text: "Добавить к сравнению", color: Colors.blueAccent),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    RowWithIcon(
                        icon: Icons.monetization_on_rounded, text: "Бонусные баллы за покупку", color: Colors.purple),
                    Divider(
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    RowWithIcon(
                        icon: Icons.directions_car_filled,
                        text: "Доставка в г.Минск 19 марта с 18:00 до 23:00. Стоимость: БЕСПЛАТНО",
                        color: Colors.black45),
                    SizedBox(
                      height: 5.0,
                    ),
                    RowWithIcon(
                        icon: Icons.local_shipping,
                        text: "Доставка в пункт самовывоза (г.Минск) 19 марта",
                        color: Colors.black45),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    RowWithIcon(icon: Icons.gpp_good_outlined, text: "Гарантия: 12 месяцев", color: Colors.blueGrey),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    Divider(
                      color: Colors.black12,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Характеристики: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spaceBetween,
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 80.0,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text('Название характеристики $index'),
                                ),
                                VerticalDivider(
                                  color: Colors.black12,
                                  width: 2,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                SizedBox(width: 10,),
                                Flexible(
                                  child: Text('Сама характеристика $index'),
                                ),
                                Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
