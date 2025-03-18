import 'package:amdby_shop/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:amdby_shop/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:amdby_shop/screens/auth/views/welcome_screen.dart';
import 'package:amdby_shop/screens/home_screen/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'amdby',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            surface: Colors.grey.shade100,
            onSurface: Colors.black87,
            primary: Color.fromRGBO(255,158,0,1),
            onPrimary: Colors.white),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                context.read<AuthenticationBloc>().userRepository
              ),
              child: const HomeScreen(),
            );
          } else {
            return WelcomeScreen();
          }
        }),
      ),
    );
  }
}
