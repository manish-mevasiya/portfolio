import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_title.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

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
            title: "My Journey",
          ),

          const SizedBox(height: 50),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              StatCard(
                width: isMobile ? 300 : 250,
                value: "2+",
                title: "Years Experience",
                icon: Icons.work_outline,
              ),

              StatCard(
                width: isMobile ? 300 : 250,
                value: "2",
                title: "Published Apps",
                icon: Icons.phone_android,
              ),

              StatCard(
                width: isMobile ? 300 : 250,
                value: "10+",
                title: "Technologies",
                icon: Icons.code,
              ),

              StatCard(
                width: isMobile ? 300 : 250,
                value: "100%",
                title: "Passion",
                icon: Icons.favorite_outline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String title;
  final IconData icon;
  final double width;

  const StatCard({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GlassCard(
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 32,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              value,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}