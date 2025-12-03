import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin ResponsiveMixin {
  // Text sizes
  double get displayLarge => 57.sp;
  double get displayMedium => 45.sp;
  double get displaySmall => 36.sp;
  double get headlineLarge => 32.sp;
  double get headlineMedium => 28.sp;
  double get headlineSmall => 24.sp;
  double get titleLarge => 22.sp;
  double get titleMedium => 16.sp;
  double get titleSmall => 14.sp;
  double get bodyLarge => 16.sp;
  double get bodyMedium => 14.sp;
  double get bodySmall => 12.sp;
  double get labelLarge => 14.sp;
  double get labelMedium => 12.sp;
  double get labelSmall => 11.sp;

  // Spacing
  double get spacingXS => 4.w;
  double get spacingS => 8.w;
  double get spacingM => 16.w;
  double get spacingL => 24.w;
  double get spacingXL => 32.w;
  double get spacingXXL => 48.w;

  // Container sizes
  double get containerWidthSmall => 300.w;
  double get containerWidthMedium => 600.w;
  double get containerWidthLarge => 900.w;
  double get containerWidthXLarge => 1200.w;

  // Screen size detection
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1200;
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  // Responsive value helper
  T responsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return desktop;
  }
}
