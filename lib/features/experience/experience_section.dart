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

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            child: const Column(
              children: [
                TimelineTile(
                  isFirst: true,
                  title: "Flutter Developer",
                  company: "Conduct Exam Technologies LLP",
                  duration: "Apr 2024 - March 2026",
                  responsibilities: [
                    "Developed and maintained cross-platform mobile applications using Flutter and Dart.",
                    "Built and enhanced production-ready white-label applications for Android and iOS platforms.",
                    "Integrated REST APIs for dynamic data management and seamless communication with backend systems.",
                    "Implemented state management using GetX and Provider for scalable and maintainable applications.",
                    "Integrated Firebase Authentication, Google Sign-In, and Firebase Cloud Messaging (FCM).",
                    "Worked on application deployment and release management for Google Play Store and Apple App Store.",
                    "Collaborated with backend developers, QA engineers, and project stakeholders to deliver high-qualitysolutions.",
                    "Improved application performance, resolved production issues, and optimized user experience."
                  ],
                ),

                SizedBox(height: 40),

                TimelineTile(
                  isLast: true,
                  title: "Flutter Intern",
                  company: "Conduct Exam Technologies LLP",
                  duration: "Apr 2024 - Sep 2024",
                  responsibilities: [
                    "Developed responsive UI components using Flutter.",
                    "Integrated REST APIs and Firebase services.",
                    "Worked with SQLite for local data storage.",
                    "Fixed bugs and enhanced existing application features.",
                    "Learned production-level Flutter development practices and mobile app deployment processes."
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
    final isMobile =  Responsive.isMobile(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(!isMobile) SizedBox(
            width: 50,
            child: Column(
              children: [
                if (!isFirst)
                  Container(
                    width: 2,
                    color: Colors.white24,
                  ),
      
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                    const LinearGradient(
                      colors: [
                        Color(0xff3B82F6),
                        Color(0xff8B5CF6),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(.5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
      
                if (!isLast)
                  Container(
                    width: 2,
                    color: Colors.white24,
                  ),
              ],
            ),
          ),
      
          const SizedBox(width: 20),
      
          Expanded(
            child: GlassCard(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                
                    const SizedBox(height: 8),
                
                    Row(
                      children: [
                        Icon(
                          Icons.home_work_sharp,
                          color: Colors.white.withOpacity(.8),
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            company,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                
                    const SizedBox(height: 8),
                
                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue
                            .withOpacity(.1),
                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Text(
                        duration,
                      ),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}