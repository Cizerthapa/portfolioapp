import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/navbar.dart';
import 'package:portfolio_web/widgets/hero_section.dart';
import 'package:portfolio_web/widgets/about_section.dart';
import 'package:portfolio_web/widgets/skills_section.dart';
import 'package:portfolio_web/widgets/projects_section.dart';
import 'package:portfolio_web/widgets/contact_section.dart';
import 'package:portfolio_web/widgets/footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/utils/responsive_mixin.dart';

import 'package:portfolio_web/widgets/dedication_banner.dart';

class HomeScreen extends StatelessWidget with ResponsiveMixin {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DedicationBanner(),
            const Navbar(),
            const HeroSection(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveValue<double>(
                  context,
                  mobile: 20.w,
                  tablet: 40.w,
                  desktop: 80.w,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: spacingXXL),
                  const AboutSection(),
                  SizedBox(height: spacingXXL),
                  const SkillsSection(),
                  SizedBox(height: spacingXXL),
                  const ProjectsSection(),
                  SizedBox(height: spacingXXL),
                  const ContactSection(),
                  SizedBox(height: spacingXXL),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
