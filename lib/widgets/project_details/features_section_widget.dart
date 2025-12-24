import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturesSection extends StatelessWidget {
  final List<String> features;

  const FeaturesSection({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        15.verticalSpace,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
              bottom: index < features.length - 1 ? 10.h : 0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 20.sp),
                10.horizontalSpace,
                Expanded(
                  child: Text(
                    features[index],
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
