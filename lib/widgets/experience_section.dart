import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> experiences = [
      {
        'company': 'Tech Solutions Inc.',
        'role': 'Senior Flutter Developer',
        'duration': '2023 - Present',
        'description':
            'Leading the mobile development team, architecting scalable Flutter apps, and mentoring junior developers.',
      },
      {
        'company': 'Creative Agency',
        'role': 'Flutter Developer',
        'duration': '2021 - 2023',
        'description':
            'Developed cross-platform mobile applications for various clients, ensuring high performance and native-like feel.',
      },
      {
        'company': 'Startup Hub',
        'role': 'Junior Mobile Dev',
        'duration': '2020 - 2021',
        'description':
            'Assisted in building MVP for startups using Flutter and Firebase. Collaborated with UI/UX designers.',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 40.w),
      color: Colors.grey.shade50,
      child: MaxContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Work Experience',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            40.verticalSpace,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Timeline Line
                      Column(
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue.shade100,
                                width: 4,
                              ),
                            ),
                          ),
                          if (index != experiences.length - 1)
                            Container(
                              width: 2,
                              height: 120.h,
                              color: Colors.grey.shade300,
                            ),
                        ],
                      ),
                      20.horizontalSpace,
                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exp['role']!,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              exp['company']!,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              exp['duration']!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              exp['description']!,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey.shade700,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
