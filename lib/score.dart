import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({Key? key, required this.totalScore, required this.round})
      : super(key: key);

  final int totalScore;
  final int round;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(child: const Text('Start Over'), onPressed: () {}),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text('Score: $totalScore'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text('Round: $round'),
            ],
          ),
        ),
        TextButton(child: const Text('Info'), onPressed: () {}),
      ],
    );
  }
}
