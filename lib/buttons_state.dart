import 'package:flutter/material.dart';

class ButtonsState extends StatefulWidget {
  const ButtonsState({super.key});

  @override
  State<ButtonsState> createState() {
    return _ButtonsState();
  }
}

class _ButtonsState extends State<ButtonsState> {
  @override
  Widget build(BuildContext context) {
    print('ButtonsState builed get Called');
    var _isUnderstood = false;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = false;
                });
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = true;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        ),
        if (_isUnderstood) const Text('Awesome!'),
      ],
    );
  }
}
