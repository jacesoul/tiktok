import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListWheelScrollView(
        diameterRatio: 1,
        offAxisFraction: 2,
        itemExtent: 200,
        children: [
          for (var x in [1, 2, 3, 4, 5, 6, 7])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.teal,
                alignment: Alignment.center,
                child: Text(
                  '$x',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
