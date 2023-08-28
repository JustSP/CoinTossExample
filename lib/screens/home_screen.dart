import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tossCoinController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Coin Toss Example"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tossCoinController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "How many times do toss the coin?"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => context.pushNamed('toss', pathParameters: {
                      "times": tossCoinController.text != ''
                          ? tossCoinController.text
                          : '10'
                    }),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Toss"),
                )),
          )
        ],
      ),
    ));
  }
}
