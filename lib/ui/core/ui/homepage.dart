import 'package:flutter/material.dart';
import 'package:re_discover/ui/HOME/view_model/home_view_model.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen.dart';
import 'package:re_discover/ui/LEADERBOARD/view_model/leaderboard_view_model.dart';
import 'package:re_discover/ui/LEADERBOARD/widgets/leaderboard_screen.dart';
import 'package:re_discover/ui/MAP/widgets/map_screen.dart';
import 'package:re_discover/ui/USER/view_model/user_view_model.dart';
import 'package:re_discover/ui/USER/widgets/user_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    MapScreen(),
    UserScreen(userViewModel: UserViewModel()),
    LeaderboardScreen(leaderboardViewModel: LeaderboardViewModel())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
            )
          ]
      ),
    );
  }
}