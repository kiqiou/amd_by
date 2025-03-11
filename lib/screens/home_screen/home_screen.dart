import 'package:amdby_shop/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:amdby_shop/screens/home_screen/widgets/promo_banner.dart';
import 'package:amdby_shop/screens/home_screen/widgets/search_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'amd',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: Color.fromRGBO(127, 124, 122, 1),
                      fontSize: 25,
                    ),
                  ),
                  TextSpan(
                    text: 'by',
                    style: TextStyle(
                      color: Color.fromRGBO(111, 191, 55, 1),
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: Icon(CupertinoIcons.arrow_right_to_line)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            SearchTextField(),
            SizedBox(height: 10.0),
            Divider(color: Theme.of(context).primaryColor),
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
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: 4,
                itemBuilder: (context, int i) {
                  return Container(
                    color: Colors.red,
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
