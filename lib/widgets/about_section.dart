import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/services/data_service.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';
import 'package:portfolio_web/widgets/stats_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: MaxContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            38.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                Container(
                  width: 300.w,
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
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
                        style: TextStyle(height: 1.6),
                      ),
                      20.verticalSpace,
                      StreamBuilder<String>(
                        stream: DataService().cvUrlStream,
                        builder: (context, snapshot) {
                          final url = snapshot.data ?? '';
                          return ElevatedButton.icon(
                            onPressed: () async {
                              if (url.isNotEmpty) {
                                final uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(
                                    uri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Could not launch $url'),
                                      ),
                                    );
                                  }
                                }
                              } else {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('CV URL not set'),
                                    ),
                                  );
                                }
                              }
                            },
                            icon: const Icon(Icons.download),
                            label: const Text('Download CV'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          );
                        },
                      ),
                      30.verticalSpace,
                      // Stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatWidget(value: '1+', label: 'Years Experience'),
                          StatWidget(value: '18+', label: 'Projects Completed'),
                          StatWidget(
                            value: '100%',
                            label: 'Client Satisfaction',
                          ),
                          StatWidget(value: '24/7', label: 'Availability'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
