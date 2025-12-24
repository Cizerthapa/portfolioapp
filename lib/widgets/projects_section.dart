import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/models/project.dart';
import 'package:portfolio_web/screens/project_detail_screen.dart';
import 'package:portfolio_web/utils/responsive_grid.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Project> projects = [
      const Project(
        title: 'E-commerce App',
        description:
            'Full-featured shopping app with payment integration, cart management, and user authentication.',
        technologies: ['Flutter', 'Firebase', 'Stripe', 'Provider'],
        githubUrl: 'https://github.com',
        demoUrl: 'https://demo.com',
        imageUrl: 'https://via.placeholder.com/400x250',
        features: [
          'User Authentication (Email, Google)',
          'Product Search & Filtering',
          'Cart & Checkout System',
          'Order History Tracking',
        ],
        challenges:
            'Integrating Stripe payment gateway securely was a challenge. I solved it by using Firebase Cloud Functions to handle the secret keys and payment intents on the server side.',
      ),
      const Project(
        title: 'Fitness Tracker',
        description:
            'Health and fitness app with workout plans, progress tracking, and nutrition logging.',
        technologies: ['Flutter', 'Firebase', 'Bloc', 'Charts'],
        githubUrl: 'https://github.com',
        demoUrl: 'https://demo.com',
        imageUrl: 'https://via.placeholder.com/400x250',
        features: [
          'Custom Workout Plans',
          'Calorie Counter',
          'Progress Charts & Analytics',
          'Social Sharing',
        ],
        challenges:
            'Managing complex state for the workout tracker was difficult. I implemented the BLoC pattern to separate business logic from UI, resulting in a clean and testable codebase.',
      ),
      const Project(
        title: 'Task Management',
        description:
            'Productivity app with task management, team collaboration, and real-time updates.',
        technologies: ['Flutter', 'Node.js', 'WebSocket'],
        githubUrl: 'https://github.com',
        demoUrl: 'https://demo.com',
        imageUrl: 'https://via.placeholder.com/400x250',
        features: [
          'Real-time Task Updates',
          'Team Collaboration Tools',
          'Push Notifications',
          'Dark Mode Support',
        ],
        challenges:
            'Ensuring real-time synchronization across devices required a robust backend. I used Node.js with Socket.io to establish a persistent connection for instant updates.',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: MaxContentWidth(
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
              spacing: 30.h,
              children: projects
                  .map((project) => ProjectCard(project: project))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailScreen(project: project),
          ),
        );
      },
      child: Container(
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
                  image: NetworkImage(project.imageUrl),
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
                    project.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    project.description,
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
                    children: project.technologies
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
                      Text(
                        'Read More',
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      5.horizontalSpace,
                      Icon(
                        Icons.arrow_forward,
                        size: 16.sp,
                        color: Colors.blue.shade600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
