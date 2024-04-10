import 'package:flutter/material.dart';

class StopwatchButtonComponent extends StatelessWidget {
  final String text;
  final IconData icon;

  const StopwatchButtonComponent({
    super.key,
    required this.text,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(icon, color: Colors.black),
          ),
          Text(text, style: const TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}
