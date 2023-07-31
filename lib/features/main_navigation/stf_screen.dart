import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increase() {
    setState(
      () {
        _clicks = _clicks + 1;
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_clicks",
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        TextButton(
          onPressed: _increase,
          child: const Text("+"),
        )
      ],
    );
  }
}
