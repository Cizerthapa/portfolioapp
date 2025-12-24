import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleLinksSection extends StatelessWidget {
  final String title;
  final String githubUrl;
  final String demoUrl;

  const TitleLinksSection({
    super.key,
    required this.title,
    required this.githubUrl,
    required this.demoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
        ),
        IconButton(
          onPressed: () => _launchUrl(githubUrl),
          icon: const Icon(Icons.code),
          tooltip: 'View Code',
        ),
        IconButton(
          onPressed: () => _launchUrl(demoUrl),
          icon: const Icon(Icons.open_in_new),
          tooltip: 'Live Demo',
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
