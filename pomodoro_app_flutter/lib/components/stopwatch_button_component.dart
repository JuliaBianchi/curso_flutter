import 'package:flutter/material.dart';

class StopwatchButtonComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;

  const StopwatchButtonComponent({
    super.key,
    required this.text,
    required this.icon,
    this.click
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(icon, color: Colors.black),
          ),
          Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
