import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final List<String> _navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Text(
            'Cizer Thapa',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          // Desktop Navigation
          Row(
            children: List.generate(
              _navItems.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(
                  onPressed: () {
                    setState(() => _selectedIndex = index);
                    _scrollToSection(index);
                  },
                  child: Text(
                    _navItems[index],
                    style: TextStyle(
                      color: _selectedIndex == index
                          ? Colors.blue
                          : Colors.grey[700],
                      fontWeight: _selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Hire Me Button
          ElevatedButton(
            onPressed: () {
              // Handle hire me action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Hire Me'),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(int index) {
    // Implement scroll to section logic
    print('Scroll to: ${_navItems[index]}');
  }
}
