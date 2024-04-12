import 'package:flutter/material.dart';

import '../components/localization_card_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003060),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocalizationCardComponent(),
          ],
        ),
      ),
    );
  }
}
