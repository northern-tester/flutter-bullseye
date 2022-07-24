import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'game_model.dart';

class Control extends StatefulWidget {
  const Control({Key? key, required this.model}) : super(key: key);

  final GameModel model;

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  final Key sliderKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('1'),
        ),
        Expanded(
          child: Slider(
            key: sliderKey,
            value: widget.model.current.toDouble(),
            onChanged: (newValue) {
              setState(() {
                widget.model.current = newValue.toInt();
              });
            },
            min: 1.0,
            max: 100.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('100'),
        ),
      ],
    );
  }
}
