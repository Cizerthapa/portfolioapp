import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final bool useDesignSize;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.useDesignSize = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            // Initialize ScreenUtil based on screen size
            return ScreenUtilInit(
              designSize: _getDesignSize(constraints.maxWidth),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) => child!,
              child: Builder(
                builder: (context) {
                  // Apply responsive padding based on screen width
                  return _ResponsivePadding(child: child);
                },
              ),
            );
          },
        );
      },
    );
  }

  Size _getDesignSize(double screenWidth) {
    if (screenWidth >= 1200) {
      return const Size(1440, 900); // Desktop
    } else if (screenWidth >= 768) {
      return const Size(768, 1024); // Tablet
    } else {
      return const Size(375, 812); // Mobile
    }
  }
}

class _ResponsivePadding extends StatelessWidget {
  final Widget child;

  const _ResponsivePadding({required this.child});

  @override
  Widget build(BuildContext context) {
    // Removed horizontal padding to allow full width
    return child;
  }
}
