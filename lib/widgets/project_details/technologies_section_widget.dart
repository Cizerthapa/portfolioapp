import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnologiesSection extends StatelessWidget {
  final List<String> technologies;

  const TechnologiesSection({super.key, required this.technologies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technologies Used',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        15.verticalSpace,
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: List.generate(
            technologies.length,
            (index) => Chip(
              label: Text(technologies[index]),
              backgroundColor: Colors.blue.shade50,
              labelStyle: TextStyle(color: Colors.blue.shade700),
            ),
          ),
        ),
      ],
    );
  }
}
