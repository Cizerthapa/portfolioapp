import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              '${percentage.toInt()}%',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
            ),
          ],
        ),
        8.verticalSpace,
        Container(
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: Colors.grey.shade200,
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (percentage / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  gradient: LinearGradient(
                    colors: [color, color.withAlpha(178)],
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
