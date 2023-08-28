import 'dart:ffi';

import 'package:coin_toss_example/screens/home_screen.dart';
import 'package:coin_toss_example/screens/splash_screen.dart';
import 'package:coin_toss_example/screens/toss_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(CoinToss());
}

class CoinToss extends StatelessWidget {
  CoinToss({super.key});

  final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'default',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/toss/:times',
        name: 'toss',
        builder: (context, state) =>
            TossScreen(times: int.parse(state.pathParameters['times'] ?? '10')),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: routerConfig);
  }
}
