import 'package:flutter/material.dart';
import 'package:portfolio_web/screens/home_screen.dart';
import 'package:portfolio_web/utils/responsive_wrapper.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      child: MaterialApp(
        title: 'Flutter Developer Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Inter',
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
        themeMode: ThemeMode.light,
        home: const HomeScreen(),
      ),
    );
  }
}
