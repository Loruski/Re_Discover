import 'package:flutter/material.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor
      ),
      body: SafeArea(
        child: Text("Badges Screen"),
      ),
    );
  }

}