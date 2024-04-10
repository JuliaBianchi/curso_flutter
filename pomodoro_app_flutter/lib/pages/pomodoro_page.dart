import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_app_flutter/components/input_time_component.dart';
import 'package:pomodoro_app_flutter/components/stopwatch_component.dart';
import 'package:pomodoro_app_flutter/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {

    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        // esticar no eixo cruzado,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: StopwatchComponent()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTimeComponent(title: 'Trabalho', value: store.workTime, increment: store.incrementWorkTime, decrement: store.decrementWorkTime),
                  InputTimeComponent(title: 'Descanso', value: store.timeOff, increment: store.incrementTimeOff, decrement: store.decrementTimeOff),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
