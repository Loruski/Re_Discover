import 'package:flutter/material.dart';
import 'package:re_discover/ui/OOBE/subwidgets/oobe_card.dart';

class Oobe extends StatelessWidget {
  const Oobe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [OobeCard()],
          ),
        ),
      ),
    );
  }
}
