import 'package:flutter/material.dart';
import 'package:re_discover/ui/OOBE/subwidgets/oobe_card.dart';
import 'package:re_discover/ui/OOBE/subwidgets/oobe_completed_card.dart';

// Entrypoint for OOBE
class Oobe extends StatelessWidget {
  const Oobe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [OobeCard()],
          ),
        ),
      ),
    );
  }
}

// OOBE completed screen
class OobeCompleted extends StatelessWidget {
  const OobeCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [OobeCompletedCard()],
          ),
        ),
      ),
    );
  }
}
