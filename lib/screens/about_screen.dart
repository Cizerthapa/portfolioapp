import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/about_section.dart';
import 'package:portfolio_web/widgets/footer.dart';
import 'package:portfolio_web/widgets/navbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: const [Navbar(), AboutSection(), Footer()]),
      ),
    );
  }
}
