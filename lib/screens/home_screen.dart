import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/widgets/navbar.dart';
import 'package:portfolio_web/widgets/hero_section.dart';
import 'package:portfolio_web/widgets/about_section.dart';
import 'package:portfolio_web/widgets/skills_section.dart';
import 'package:portfolio_web/widgets/projects_section.dart';
import 'package:portfolio_web/widgets/contact_section.dart';
import 'package:portfolio_web/widgets/footer.dart';

import 'package:portfolio_web/utils/responsive_mixin.dart';

import 'package:portfolio_web/widgets/dedication_banner.dart';
import 'package:portfolio_web/widgets/experience_section.dart';
import 'package:portfolio_web/widgets/services_section.dart';

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
            Column(
              children: [
                spacingXXL.toInt().verticalSpace,
                const AboutSection(),
                spacingXXL.toInt().verticalSpace,
                const ServicesSection(),
                spacingXXL.toInt().verticalSpace,
                const ExperienceSection(),
                spacingXXL.toInt().verticalSpace,
                const SkillsSection(),
                spacingXXL.toInt().verticalSpace,
                const ProjectsSection(),
                spacingXXL.toInt().verticalSpace,
                const ContactSection(),
                spacingXXL.toInt().verticalSpace,
              ],
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
