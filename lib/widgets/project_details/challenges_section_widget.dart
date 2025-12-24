import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChallengesSection extends StatelessWidget {
  final String challenges;

  const ChallengesSection({super.key, required this.challenges});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Challenges & Solutions',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        10.verticalSpace,
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.orange.shade100),
          ),
          child: Text(
            challenges,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.brown.shade700,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
