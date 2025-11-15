import 'package:flutter/material.dart';
import 'package:re_discover/ui/HOME/widgets/city_selector_screen_header.dart';

class CitySelectorScreen extends StatelessWidget {
  const CitySelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("City selector", style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 5),
          child: Column(
            children: [
              CitySelectorScreenHeader(),
              SizedBox(height: 20),
              SearchBar(
                hintText: "Search city",
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                leading: Icon(Icons.search),

                onChanged: (value) {},
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text("test"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
