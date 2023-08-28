import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Future.delayed(const Duration(seconds: 5), () {
      context.go("/home");
    });

    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: screenWidth,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Coin Toss Example',
              style: TextStyle(fontSize: 24),
            ),
            CircularProgressIndicator()
          ],
        ),
      )),
    );
  }
}
