import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                  image: const DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              60.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Passionate Flutter Developer',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'Hello! I\'m Cizer, a Flutter Developer with 1+ years of experience creating beautiful, performant mobile and web applications. I specialize in building cross-platform solutions using Flutter and Dart.',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey.shade600,
                        height: 1.6,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'My expertise includes state management (Provider, Bloc), Firebase integration, REST APIs, and creating responsive UIs that work flawlessly on all devices.',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey.shade600,
                        height: 1.6,
                      ),
                    ),
                    30.verticalSpace,
                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStat('3+', 'Years Experience'),
                        _buildStat('50+', 'Projects Completed'),
                        _buildStat('100%', 'Client Satisfaction'),
                        _buildStat('24/7', 'Availability'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        4.verticalSpace,
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
