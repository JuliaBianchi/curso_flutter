import 'package:flutter/material.dart';
import 'package:pomodoro_app_flutter/pages/pomodoro_page.dart';
import 'package:pomodoro_app_flutter/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        )
      ],
      child: const MaterialApp(
        title: 'Pomodoro App',
        debugShowCheckedModeBanner: false,
        home: PomodoroPage(),
      ),
    );
  }
}