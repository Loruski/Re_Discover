import 'package:flutter/material.dart';
import 'package:re_discover/data/states/state_hub.dart';
import 'package:re_discover/ui/HOME/screens/home_screen.dart';
import 'package:re_discover/ui/LEADERBOARD/screen/leaderboard_screen.dart';
import 'package:re_discover/ui/MAP/screens/map_screen.dart';
import 'package:re_discover/ui/USER/screens/user_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Rimuovi initialIndex

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = StateHub().navigationState.selectedIndex;

    // Ascolta i cambiamenti dall'esterno
    StateHub().navigationState.addListener(_onIndexChanged);
  }

  void _onIndexChanged() {
    if (mounted) {
      setState(() {
        _selectedIndex = StateHub().navigationState.selectedIndex;
      });
    }
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Aggiorna anche lo stato globale
    StateHub().navigationState.setSelectedIndex(index);
  }

  @override
  void dispose() {
    StateHub().navigationState.removeListener(_onIndexChanged);
    super.dispose();
  }

  final List<Widget> _pages = [
    HomeScreen(),
    MapScreen(),
    UserScreen(),
    LeaderboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
        ],
      ),
    );
  }
}
