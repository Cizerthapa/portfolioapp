import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/utils/responsive_grid.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {
        'title': 'E-commerce App',
        'description':
            'Full-featured shopping app with payment integration, cart management, and user authentication.',
        'technologies': ['Flutter', 'Firebase', 'Stripe', 'Provider'],
        'github': 'https://github.com',
        'demo': 'https://demo.com',
        'image': 'https://via.placeholder.com/400x250',
      },
      {
        'title': 'Fitness Tracker',
        'description':
            'Health and fitness app with workout plans, progress tracking, and nutrition logging.',
        'technologies': ['Flutter', 'Firebase', 'Bloc', 'Charts'],
        'github': 'https://github.com',
        'demo': 'https://demo.com',
        'image': 'https://via.placeholder.com/400x250',
      },
      {
        'title': 'Task Management',
        'description':
            'Productivity app with task management, team collaboration, and real-time updates.',
        'technologies': ['Flutter', 'Node.js', 'WebSocket'],
        'github': 'https://github.com',
        'demo': 'https://demo.com',
        'image': 'https://via.placeholder.com/400x250',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          40.verticalSpace,
          ResponsiveGrid(
            desktopColumns: 3,
            tabletColumns: 2,
            mobileColumns: 1,
            spacing: 30,
            children: projects
                .map((project) => ProjectCard(project: project))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(25),
            blurRadius: 20.r,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                topRight: Radius.circular(14.r),
              ),
              image: DecorationImage(
                image: NetworkImage(project['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Project Content
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['title'],
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace,
                Text(
                  project['description'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                    height: 1.5.h,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                14.verticalSpace,
                Wrap(
                  spacing: 8.h,
                  runSpacing: 8.h,
                  children: (project['technologies'] as List<String>)
                      .map(
                        (tech) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle GitHub
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue.shade400),
                        ),
                        child: Text(
                          'GitHub',
                          style: TextStyle(color: Colors.blue.shade600),
                        ),
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Live Demo
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                        ),
                        child: const Text(
                          'Live Demo',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
