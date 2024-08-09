import 'package:client/src/screens/home_screen.dart';
import 'package:client/src/wigets/appbar/app_bar.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeLayout createState() => _HomeLayout();
}

class _HomeLayout extends State<HomeLayout> {
  int _selectedIndex = 0;

  final List<Widget> _wigetOptions = <Widget>[
    const HomeScreen(),
    const Text("Search page",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text("Profile page",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'The coffee shop',
      ),
      body: Center(
        child: _wigetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
