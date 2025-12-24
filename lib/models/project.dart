class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String imageUrl;
  final String githubUrl;
  final String demoUrl;
  final List<String> features;
  final String challenges;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    required this.githubUrl,
    required this.demoUrl,
    this.features = const [],
    this.challenges = '',
  });
}
