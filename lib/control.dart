import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control({Key? key}) : super(key: key);

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  var _currentValue = 50.0;
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
            value: _currentValue,
            onChanged: (newValue) {
              setState(() {
                _currentValue = newValue;
                if (kDebugMode) {
                  print(_currentValue);
                }
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
