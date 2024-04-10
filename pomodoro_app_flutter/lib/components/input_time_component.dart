import 'package:flutter/material.dart';

class InputTimeComponent extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? increment;
  final void Function()? decrement;

  const InputTimeComponent({
    super.key,
    required this.title,
    required this.value,
    this.increment,
    this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontSize: 25),),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: decrement,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15.0),
                backgroundColor: Colors.redAccent.shade200
              ),
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 25,
              ),
            ),
            Text(
              '$value min',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: increment,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15.0),
                backgroundColor: Colors.redAccent.shade200
              ),
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
