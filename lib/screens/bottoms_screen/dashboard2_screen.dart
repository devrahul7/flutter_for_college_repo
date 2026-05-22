import 'package:flutter/material.dart';
import 'package:flutter_for_college/screens/bottoms_screen/about_screen.dart';
import 'package:flutter_for_college/screens/bottoms_screen/cart_screen.dart';
import 'package:flutter_for_college/screens/bottoms_screen/home_screen.dart';
import 'package:flutter_for_college/screens/bottoms_screen/profile_screen.dart';

class Dashboard2Screen extends StatefulWidget {
  const Dashboard2Screen({super.key});

  @override
  State<Dashboard2Screen> createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<Dashboard2Screen> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"), centerTitle: true),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "About"),
        ],
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,

        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
