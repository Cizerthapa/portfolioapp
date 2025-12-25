import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio_web/screens/admin_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/logic/navigation/navigation_cubit.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';

class Navbar extends StatelessWidget {
  final Function(int) onNavTap;

  const Navbar({super.key, required this.onNavTap});

  static const List<String> _navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: MaxContentWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                _AdminAccessWrapper(
                  child: Text(
                    'Cizer Thapa',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),

                // Desktop Navigation
                Row(
                  children: List.generate(
                    _navItems.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextButton(
                        onPressed: () => onNavTap(index),
                        child: Text(
                          _navItems[index],
                          style: TextStyle(
                            color: state.selectedIndex == index
                                ? Colors.blue
                                : Colors.grey[700],
                            fontWeight: state.selectedIndex == index
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
                    // Handle hire me action for Contact
                    onNavTap(4); // 4 is contact index
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 15.h,
                    ),
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
      },
    );
  }
}

class _AdminAccessWrapper extends StatefulWidget {
  final Widget child;
  const _AdminAccessWrapper({required this.child});

  @override
  State<_AdminAccessWrapper> createState() => _AdminAccessWrapperState();
}

class _AdminAccessWrapperState extends State<_AdminAccessWrapper> {
  Timer? _timer;

  void _handleTapDown(TapDownDetails details) {
    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const AdminScreen()));
    });
  }

  void _handleTapUp(TapUpDetails details) {
    _timer?.cancel();
  }

  void _handleTapCancel() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: widget.child,
    );
  }
}
