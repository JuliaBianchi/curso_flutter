import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_app_flutter/components/stopwatch_button_component.dart';
import 'package:pomodoro_app_flutter/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class StopwatchComponent extends StatelessWidget {
  const StopwatchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) {
        return Container(
          color: store.isWorking() ? Colors.red.shade400 : Colors.green.shade400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 20, left: 10, right: 10),
                child: Text('POMODORO TIMER', style: TextStyle(fontSize: 35, color: store.isWorking() ? const Color(0xFF970C10) : const Color(0xFF116530), fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Text(
                  store.isWorking() ? 'FOCUS' : 'BREAK',
                  style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 100, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.started)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StopwatchButtonComponent(
                          text: 'Start',
                          icon: Icons.play_arrow,
                          click: store.start,
                      ),
                    ),
                  if (store.started)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StopwatchButtonComponent(
                          text: 'Stop', icon: Icons.stop, click: store.stop,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: StopwatchButtonComponent(
                        text: 'Restart',
                        icon: Icons.refresh,
                        click: store.refresh,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
