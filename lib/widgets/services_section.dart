import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/utils/responsive_grid.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';
import 'package:portfolio_web/widgets/service_card_widget.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'title': 'Mobile App Development',
        'icon': Icons.phone_android,
        'description':
            'Building high-quality, cross-platform mobile applications for iOS and Android using Flutter.',
      },
      {
        'title': 'Web Development',
        'icon': Icons.web,
        'description':
            'Creating responsive and performant web applications with modern technologies and frameworks.',
      },
      {
        'title': 'UI/UX Design',
        'icon': Icons.design_services,
        'description':
            'Designing intuitive and beautiful user interfaces that provide exceptional user experiences.',
      },
      {
        'title': 'Backend Integration',
        'icon': Icons.cloud,
        'description':
            'Integrating robust backend services, APIs, and databases to power your applications.',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 40.w),
      child: MaxContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Services',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            38.verticalSpace,
            ResponsiveGrid(
              desktopColumns: 4,
              tabletColumns: 2,
              mobileColumns: 1,
              spacing: 20.h,
              children: services
                  .map((service) => ServiceCard(service))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
