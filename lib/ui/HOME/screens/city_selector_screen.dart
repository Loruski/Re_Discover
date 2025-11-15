import 'package:flutter/material.dart';
import 'package:re_discover/ui/HOME/widgets/city_selector_subwidgets/city_card.dart';

class CitySelectorScreen extends StatelessWidget {
  const CitySelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 120.0,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("City selector", style: TextStyle(fontSize: 20)),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SearchBar(
                  elevation: const WidgetStatePropertyAll<double>(0.7),
                  backgroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
                  hintText: "Search city",
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  leading: const Icon(Icons.search),
                  onChanged: (value) {},
                ),
              ),
            ),
            SliverList(
              // We can use this function also when we'll have the real data flowing into the app
              delegate:
                  SliverChildBuilderDelegate(childCount: 20, (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CityCard(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}