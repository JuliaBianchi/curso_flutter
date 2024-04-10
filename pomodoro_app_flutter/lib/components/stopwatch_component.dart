import 'package:flutter/material.dart';
import 'package:pomodoro_app_flutter/components/stopwatch_button_component.dart';

class StopwatchComponent extends StatelessWidget {
  const StopwatchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent.shade200,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Text(
            '25:00',
            style: TextStyle(fontSize: 100, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.all(10.0),
                child: StopwatchButtonComponent(text: 'Iniciar', icon: Icons.play_arrow),
              ),
              Padding(
                padding:  EdgeInsets.all(10.0),
                child: StopwatchButtonComponent(text: 'Parar', icon: Icons.stop),
              ),
              Padding(
                padding:  EdgeInsets.all(10.0),
                child: StopwatchButtonComponent(text: 'Reiniciar', icon: Icons.refresh),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
