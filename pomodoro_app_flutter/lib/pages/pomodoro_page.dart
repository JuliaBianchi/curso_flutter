import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app_flutter/components/input_time_component.dart';
import 'package:pomodoro_app_flutter/components/stopwatch_component.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        // esticar no eixo cruzado,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: StopwatchComponent()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputTimeComponent(title: 'Trabalho', value: 25),
                InputTimeComponent(title: 'Descanso', value: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
