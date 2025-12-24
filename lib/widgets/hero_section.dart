import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade50, Colors.purple.shade50],
        ),
      ),
      child: MaxContentWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, I\'m',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                  10.verticalSpace,
                  Text(
                    'Cizer Thapa',
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'I create beautiful, performant mobile & web applications using Flutter. With 1+ years of experience, I help startups and businesses bring their ideas to life.',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                  28.verticalSpace,
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.w,
                            vertical: 18.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('View Projects'),
                      ),
                      20.horizontalSpace,
                      OutlinedButton(
                        onPressed: () {
                          // Download CV
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.w,
                            vertical: 18.h,
                          ),
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'Download CV',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  // Social Icons
                  Row(
                    children: [
                      _buildSocialIcon(Icons.code, 'GitHub'),
                      15.horizontalSpace,
                      _buildSocialIcon(Icons.work, 'LinkedIn'),
                      15.horizontalSpace,
                      _buildSocialIcon(Icons.mail, 'Email'),
                      15.horizontalSpace,
                      _buildSocialIcon(Icons.chat, 'Twitter'),
                    ],
                  ),
                ],
              ),
            ),

            // Right Image/Placeholder
            Expanded(
              child: Center(
                child: Container(
                  width: 400.w,
                  height: 400.h,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20.r),
                    image: const DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/400'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 100.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(128),
              blurRadius: 10.r,
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.blue),
          onPressed: () {
            // Handle social link
          },
        ),
      ),
    );
  }
}
