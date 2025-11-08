import 'package:flutter/material.dart';

class CitiesViewModel extends StatefulWidget {
  const CitiesViewModel({Key? key}) : super(key: key);

  @override
  _CitiesViewModelState createState() => _CitiesViewModelState();
}

class _CitiesViewModelState extends State<CitiesViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities'),
      ),
      body: const Center(
        child: Text('Cities View Model'),
      ),
    );
  }
}