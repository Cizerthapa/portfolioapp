import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroImageSection extends StatelessWidget {
  final String imageUrl;

  const HeroImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 300.h,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: double.infinity,
          height: 300.h,
          color: Colors.grey.shade200,
          child: Icon(Icons.image, size: 50.sp, color: Colors.grey),
        ),
      ),
    );
  }
}
