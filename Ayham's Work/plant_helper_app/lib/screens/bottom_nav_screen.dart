import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'qr.dart';
import 'question_screen.dart';


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const MainScreen(),
    const QrScreen(),
    const QuestionScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/home.png'),
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/glasses.png'),
              size: 24,
            ),
            label: 'Glass',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/comment.png'),
              size: 24,
            ),
            label: 'Q & A',
          ),
        ],
      ),
     );
  }
}
