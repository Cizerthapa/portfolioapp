import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatWidget extends StatelessWidget {
  final String value;
  final String label;
  final double valueFontSize;
  final Color valueColor;
  final double labelFontSize;
  final Color labelColor;
  final double verticalSpacing;

  const StatWidget({
    super.key,
    required this.value,
    required this.label,
    this.valueFontSize = 32.0,
    this.valueColor = Colors.blue,
    this.labelFontSize = 14.0,
    this.labelColor = Colors.grey,
    this.verticalSpacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: valueFontSize.sp,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
        verticalSpacing.verticalSpace,
        Text(
          label,
          style: TextStyle(fontSize: labelFontSize.sp, color: labelColor),
        ),
      ],
    );
  }
}
