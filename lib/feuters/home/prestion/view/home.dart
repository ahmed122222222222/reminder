import 'package:ah/core/styel.dart';
import 'package:ah/feuters/alarim/presention/view/alrim.dart';
import 'package:ah/feuters/home/prestion/view/widget/bodyhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreeN extends StatefulWidget {
  const HomeScreeN({super.key});

  @override
  State<HomeScreeN> createState() => _HomeScreeNState();
}

class _HomeScreeNState extends State<HomeScreeN> {
  int _currentIndex = 0;

  final List<Widget> _screens = [const BodyHome(),alarim()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "23 يناير",
          style: AppStyles.stylebold24(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.calendar_month,
              color: Colors.blue,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.black12,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
