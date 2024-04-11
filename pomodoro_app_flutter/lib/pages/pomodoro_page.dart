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
          const Expanded(child: StopwatchComponent()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTimeComponent(
                      title: 'FOCUS',
                      value: store.workTime,
                      increment: store.started && store.isWorking()
                          ? null
                          : store.incrementWorkTime,
                      decrement: store.started && store.isWorking()
                          ? null
                          : store.decrementWorkTime,
                  ),
                  InputTimeComponent(
                      title: 'BREAK',
                      value: store.timeOff,
                      increment: store.started && store.isTimeOff()
                          ? null
                          : store.incrementTimeOff,
                      decrement: store.started && store.isTimeOff()
                          ? null
                          : store.decrementTimeOff
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
