import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Expertise',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          const SizedBox(height: 40),
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
    );
  }
}

class SkillProgressBar extends StatelessWidget {
  final String skillName;
  final double percentage;
  final Color color;

  const SkillProgressBar({
    super.key,
    required this.skillName,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              '${percentage.toInt()}%',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade200,
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (percentage / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.7)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
