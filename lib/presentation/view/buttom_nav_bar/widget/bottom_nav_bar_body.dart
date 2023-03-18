import 'package:flutter/material.dart';
import '../../../../core/constances.dart';
import '../pages/browse.dart';
import '../pages/store.dart';
import '../pages/order_history.dart';
import '../pages/home.dart';
import '../pages/profile.dart';

class BottomNavBarBody extends StatefulWidget {
  const BottomNavBarBody({Key? key}) : super(key: key);

  @override
  _BottomNavBarBodyState createState() => _BottomNavBarBodyState();
}

class _BottomNavBarBodyState extends State<BottomNavBarBody> {
  int _currentIndex = 0;

  final List children = [
    HomeScreen(),
    BrowseScreen(),
    StoreScreen(),
    OrderHistoryScreen(),
    ProfileScreen(),
  ];

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 33,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: MainColor,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: ('Browse'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: ('Store'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: ('Order'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: ('Profile'),
          ),
        ],
      ),
    );
  }
}