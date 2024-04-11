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
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: decrement,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10.0),
                backgroundColor: Colors.black,
              ),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(
                  Icons.minimize,
                  color: Colors.white,
                  size: 25,

                ),
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
                backgroundColor: Colors.black,
              ),
              child: const Icon(
                Icons.add,
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
