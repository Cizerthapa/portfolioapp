import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/logic/navigation/navigation_cubit.dart';
import 'package:portfolio_web/utils/responsive_mixin.dart';
import 'package:portfolio_web/widgets/about_section.dart';
import 'package:portfolio_web/widgets/contact_section.dart';
import 'package:portfolio_web/widgets/experience_section.dart';
import 'package:portfolio_web/widgets/footer.dart';
import 'package:portfolio_web/widgets/hero_section.dart';
import 'package:portfolio_web/widgets/navbar.dart';
import 'package:portfolio_web/widgets/projects_section.dart';
import 'package:portfolio_web/widgets/services_section.dart';
import 'package:portfolio_web/widgets/skills_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatefulWidget {
  const _HomeScreenContent();

  @override
  State<_HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<_HomeScreenContent>
    with ResponsiveMixin {
  final ScrollController _scrollController = ScrollController();

  // Keys to access sections
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();

  // Navbar had: Home, About, Skills, Projects, Contact.
  // We need to map these to sections.
  // Home -> Top
  // About -> AboutSection
  // Skills -> SkillsSection (Wait, the list has Skills)
  // Projects -> ProjectsSection
  // Contact -> ContactSection

  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!mounted) return;

    // Define the keys and their corresponding indices
    final sections = [
      MapEntry(_homeKey, 0),
      MapEntry(_aboutKey, 1),
      MapEntry(_skillsKey, 2),
      MapEntry(_projectsKey, 3),
      MapEntry(_contactKey, 4),
    ];

    int activeIndex = 0;
    // double minDistance = double.infinity; // Unused

    // Find the section closest to the top (with some offset for navbar/perception)
    // We consider a section "active" if its top is near the trigger point.
    // Or simpler: The section that covers the top part of the screen.

    // Let's use a trigger point at roughly 1/3 of the screen height.
    final double triggerPoint = 200.h; // Adjust as needed

    for (var entry in sections) {
      final key = entry.key;
      final index = entry.value;

      if (key.currentContext != null) {
        final RenderBox box =
            key.currentContext!.findRenderObject() as RenderBox;
        final Offset position = box.localToGlobal(Offset.zero);

        // We look for the last section whose top has passed (is above) the trigger point?
        // Actually, we want the section that is currently "in focus".
        // A simple heuristic: Find section with top closest to 0 but allowed to be negative (scrolled past).

        // Better heuristic: Last section whose top is <= triggerPoint.
        if (position.dy <= triggerPoint) {
          activeIndex = index;
        }
      }
    }

    // Only update if changed
    if (context.read<NavigationCubit>().state.selectedIndex != activeIndex) {
      context.read<NavigationCubit>().updateIndex(activeIndex);
    }
  }

  void _scrollToSection(int index) {
    GlobalKey? targetKey;
    switch (index) {
      case 0: // Home
        targetKey = _homeKey;
        break;
      case 1: // About
        targetKey = _aboutKey;
        break;
      case 2: // Skills
        targetKey = _skillsKey;
        break;
      case 3: // Projects
        targetKey = _projectsKey;
        break;
      case 4: // Contact
        targetKey = _contactKey;
        break;
    }

    if (targetKey != null && targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else if (index == 0) {
      // Fallback for home if key context issue (e.g. top of page)
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }

    // Update Cubit
    context.read<NavigationCubit>().updateIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // const DedicationBanner(),
            Navbar(onNavTap: _scrollToSection),
            HeroSection(key: _homeKey),
            Column(
              children: [
                spacingXXL.toInt().verticalSpace,
                AboutSection(key: _aboutKey),
                spacingXXL.toInt().verticalSpace,
                const ServicesSection(), // Not in nav?
                spacingXXL.toInt().verticalSpace,
                const ExperienceSection(), // Not in nav?
                spacingXXL.toInt().verticalSpace,
                SkillsSection(key: _skillsKey),
                spacingXXL.toInt().verticalSpace,
                ProjectsSection(key: _projectsKey),
                spacingXXL.toInt().verticalSpace,
                ContactSection(key: _contactKey),
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
