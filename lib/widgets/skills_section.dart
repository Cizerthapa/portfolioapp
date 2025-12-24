import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';
import 'package:portfolio_web/widgets/skill_progress_bar_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> skills = [
      {'name': 'Flutter/Dart', 'level': 95, 'color': Colors.blue},
      {'name': 'Firebase', 'level': 90, 'color': Colors.orange},
      {'name': 'REST APIs', 'level': 85, 'color': Colors.green},
      {'name': 'State Management', 'level': 90, 'color': Colors.purple},
      {'name': 'UI/UX Design', 'level': 80, 'color': Colors.pink},
      {'name': 'Git & CI/CD', 'level': 85, 'color': Colors.red},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 28.h),
      child: MaxContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills & Expertise',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            28.verticalSpace,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 3,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                final skill = skills[index];
                return SkillProgressBar(
                  skillName: skill['name'],
                  percentage: skill['level'],
                  color: skill['color'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
