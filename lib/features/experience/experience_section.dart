import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: "Experience",
          ),

          const SizedBox(height: 60),

          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1000,
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TimelineTile(
                    isFirst: true,
                    title: "Flutter Developer",
                    company: "Conduct Exam Technologies LLP",
                    duration: "Apr 2024 - March 2026",
                    responsibilities: [
                      "Developed and maintained cross-platform mobile applications using Flutter and Dart.",
                      "Integrated REST APIs and managed state using GetX for efficient performance.",
                      "Successfully deployed applications on Google Play Store and Apple App Store.",
                      "Built and optimized features for an 'Online Exam Solution' app used by real users.",
                      "Improved app performance and code quality by refactoring existing codebase.",
                      "Collaborated with backend developers, QA testers, and product managers in agile environment.",
                    ],
                  ),

                  SizedBox(height: 40),

                  TimelineTile(
                    isLast: true,
                    title: "Flutter Intern",
                    company: "Conduct Exam Technologies LLP",
                    duration: "Apr 2024 - Sep 2024",
                    responsibilities: [
                      "Learned and implemented Flutter fundamentals to build responsive UI.",
                      "Worked with REST APIs, Firebase, and local databases like SQLite.",
                      "Assisted in developing features and fixing bugs in live projects.",
                      "Gained hands-on experience with state management, version control, and mobile application deployment processes.",
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;

  final String title;
  final String company;
  final String duration;

  final List<String> responsibilities;

  const TimelineTile({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    required this.title,
    required this.company,
    required this.duration,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GlassCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  company,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(duration),
                ),

                const SizedBox(height: 20),

                ...responsibilities.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(item),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}