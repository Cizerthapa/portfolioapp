import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';

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
      child: MaxContentWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Text(
              'Cizer Thapa',
              style: TextStyle(
                fontSize: 24.sp,
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
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text('Hire Me', style: TextStyle(fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToSection(int index) {
    String routeName = '/';
    switch (index) {
      case 0:
        routeName = '/';
        break;
      case 1:
        routeName = '/about';
        break;
      case 2:
        // Skills is still on home for now, or could be a new page
        routeName = '/';
        break;
      case 3:
        // Projects is still on home for now, or could be a new page
        routeName = '/';
        break;
      case 4:
        routeName = '/contact';
        break;
    }

    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushNamed(context, routeName);
    }
  }
}
