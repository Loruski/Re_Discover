import 'package:flutter/material.dart';

class ProfilePersonalization extends StatelessWidget {
  const ProfilePersonalization({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor
      ),
      body: SafeArea(
        child: Text("user personalization"),
      ),
    );
  }

}