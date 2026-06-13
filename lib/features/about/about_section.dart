import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/utils/responsive.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: "About Me",
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: GlassCard(
              child: isMobile
                  ? const _MobileLayout()
                  : const _DesktopLayout(),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              const Text(
                "Who am I?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Text(
                AppStrings.about,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                ),
              ),

              SizedBox(height: 30),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  InfoChip(
                    icon: Icons.location_on_outlined,
                    title: "Rajkot, Gujarat",
                  ),
                  InfoChip(
                    icon: Icons.code,
                    title: "Flutter Developer",
                  ),
                  InfoChip(
                    icon: Icons.work_outline,
                    title: "2+ Years Experience",
                  ),
                ],
              ),
            ],
          ),
        ),

        // SizedBox(width: 40),
        //
        // Expanded(
        //   child: Column(
        //     children: [
        //       HighlightCard(
        //         title: "Cross Platform",
        //         subtitle:
        //         "Android & iOS Apps",
        //       ),
        //       SizedBox(height: 15),
        //       HighlightCard(
        //         title: "State Management",
        //         subtitle:
        //         "Provider & GetX",
        //       ),
        //       SizedBox(height: 15),
        //       HighlightCard(
        //         title: "Backend",
        //         subtitle:
        //         "REST APIs & Firebase",
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Who am I?",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 20),

        Text(
          AppStrings.about,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.8,
          ),
        ),

        SizedBox(height: 25),

        InfoChip(
          icon: Icons.location_on_outlined,
          title: "Rajkot, Gujarat",
        ),

        SizedBox(height: 10),

        InfoChip(
          icon: Icons.code,
          title: "Flutter Developer",
        ),

        SizedBox(height: 10),

        InfoChip(
          icon: Icons.work_outline,
          title: "2+ Years Experience",
        ),

        SizedBox(height: 25),

        HighlightCard(
          title: "Cross Platform",
          subtitle: "Android & iOS Apps",
        ),

        SizedBox(height: 15),

        HighlightCard(
          title: "Provider & GetX",
          subtitle: "State Management",
        ),

        SizedBox(height: 15),

        HighlightCard(
          title: "REST APIs",
          subtitle: "Firebase Integration",
        ),
      ],
    );
  }
}

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String title;

  const InfoChip({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(30),
        color: Colors.white.withOpacity(.05),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}

class HighlightCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const HighlightCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(16),
        color: Colors.white.withOpacity(.05),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(subtitle),
        ],
      ),
    );
  }
}