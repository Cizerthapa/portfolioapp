import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/models/project.dart';
import 'package:portfolio_web/widgets/project_details/challenges_section_widget.dart';
import 'package:portfolio_web/widgets/project_details/features_section_widget.dart';
import 'package:portfolio_web/widgets/project_details/description_section_widget.dart';
import 'package:portfolio_web/widgets/project_details/hero_image_section_widget.dart';
import 'package:portfolio_web/widgets/project_details/technologies_section_widget.dart';
import 'package:portfolio_web/widgets/project_details/title_links_section_widget.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final sections = _buildSections(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroImageSection(imageUrl: project.imageUrl),
            30.verticalSpace,
            TitleLinksSection(
              title: project.title,
              githubUrl: project.githubUrl,
              demoUrl: project.demoUrl,
            ),
            20.verticalSpace,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sections.length,
              itemBuilder: (context, index) => sections[index],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSections(BuildContext context) {
    return [
      DescriptionSection(description: project.description),
      30.verticalSpace,
      TechnologiesSection(technologies: project.technologies),
      30.verticalSpace,
      if (project.features.isNotEmpty) ...[
        FeaturesSection(features: project.features),
        30.verticalSpace,
      ],
      if (project.challenges.isNotEmpty) ...[
        ChallengesSection(challenges: project.challenges),
        40.verticalSpace,
      ],
    ];
  }
}
