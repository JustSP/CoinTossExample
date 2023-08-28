import 'dart:math';

import 'package:flutter/material.dart';

class TossScreen extends StatefulWidget {
  final int? times;
  const TossScreen({super.key, this.times});

  @override
  State<TossScreen> createState() => _TossScreenState();
}

class _TossScreenState extends State<TossScreen> {
  int _times = 10;
  List<String> coinFaces = ['Heads', 'Tails'];
  List<String> tossResults = [];
  int finalHeadsStreak = 0, finalTailsStreak = 0;

  @override
  void initState() {
    _times = widget.times ?? 10;
    _times = _times > 0 ? _times : _times * -1;

    var lastTossResult = '';
    int totalHeadsStreak = 0, totalTailsStreak = 0;
    var headStreak = 0, tailStreak = 0;
    for (var i = 0; i < _times; i++) {
      var tossResult = coinFaces[Random().nextInt(2)];

      tossResults.add(tossResult);
      if (tossResult == 'Heads') {
        if (lastTossResult == '' || lastTossResult == 'Heads') {
          headStreak++;
        } else {
          if (tailStreak > 0 && totalTailsStreak < tailStreak) {
            totalTailsStreak = tailStreak;
            tailStreak = 0;
          }

          headStreak = 1;
        }
      } else {
        if (lastTossResult == '' || lastTossResult == 'Tails') {
          tailStreak++;
        } else {
          if (headStreak > 0 && totalHeadsStreak < headStreak) {
            totalHeadsStreak = headStreak;
            headStreak = 0;
          }

          tailStreak = 1;
        }
      }

      lastTossResult = tossResult;
    }

    if (totalHeadsStreak < headStreak) {
      totalHeadsStreak = headStreak;
    }

    if (totalTailsStreak < tailStreak) {
      totalTailsStreak = tailStreak;
    }

    setState(() {
      finalHeadsStreak = totalHeadsStreak;
      finalTailsStreak = totalTailsStreak;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Tossing coin $_times times")),
          body: Column(
            children: [
              SizedBox(
                //height: 130,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                  child: ListTile(
                    selected: true,
                    selectedTileColor: Colors.amber,
                    selectedColor: Colors.black,
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 8, top: 12),
                      child: Text("Results",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900)),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 8.0),
                          child: Text('Best Heads Streak $finalHeadsStreak'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text('Best Tails Streak $finalTailsStreak'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (itemContext, index) {
                      int currentIndex = index + 1;
                      return InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(tossResults[index]),
                          subtitle: Text("Toss result: $currentIndex"),
                        ),
                      );
                    },
                    itemCount: tossResults.length),
              )
            ],
          )),
    );
  }
}
