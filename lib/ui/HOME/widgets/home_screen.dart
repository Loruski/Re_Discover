import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/HOME/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  /// Upper row container
                  Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Colors.purple,
                      ),
                      Text(
                        "Re:Discover",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ciao, Esploratore!",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.waving_hand,
                            size: 20,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  /// Cards container, consider splitting it into subwidgets
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        elevation: 1,
                        shadowColor: Colors.black,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(

                          /// Change it asap to resize according to the size of the viewport
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Livello",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),

                                      /// Here we should retrieve user's level
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.radar,
                                    size: 50,
                                    color: Colors.orange,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              LinearProgressIndicator(

                                /// Here we should calculate the value from the amount of required XP to level up and the amount of XP the user has
                                value: 0.4,
                                minHeight: 6,
                                borderRadius: BorderRadius.circular(10),
                                backgroundColor: Colors.grey[300],
                                color: Colors.orange,
                              ),
                              SizedBox(height: 15),

                              /// Here we should retrieve the amount of XP that the user has, and the amount of XP required to level up
                              Text("80 / 120 XP"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 120,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 1,
                                  shadowColor: Colors.black,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        size: 40,
                                        color: Colors.green,
                                      ),
                                      Text("Risposte corrette",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      /// Here we should also update this stat dynamically
                                      Text("11"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 120,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 1,
                                  shadowColor: Colors.black,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.gps_fixed,
                                        size: 40,
                                        color: Colors.blue,
                                      ),
                                      Text("Precisione",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      /// Here we should also update this stat dynamically
                                      Text("43%"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Implement navigation
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            backgroundColor: Colors.purple),
                        icon:
                        const Icon(Icons.explore_outlined, color: Colors.white),
                        label: const Text(
                          "Inizia esplorazione",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          // TODO: Implement navigation
                        },
                        child: const Text("Cambia città"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
