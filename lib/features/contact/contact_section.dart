import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_strings.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchLinkedIn() async {
    final uri = Uri.parse(AppStrings.linkedIn);
    await launchUrl(uri);
  }

  Future<void> _launchGitHub() async {
    final uri = Uri.parse(AppStrings.gitHub);
    await launchUrl(uri);
  }

  Future<void> _launchEmail() async {
    final uri = Uri.parse('mailto:${AppStrings.email}');
    await launchUrl(uri);
  }

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
            title: "Let's Connect",
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Interested in working together?",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "I'm open to Flutter Developer opportunities, freelance projects and collaboration.",
                  ),

                  const SizedBox(height: 40),

                  const ContactItem(
                    icon: Icons.email,
                    title: AppStrings.email,
                  ),

                  const SizedBox(height: 15),

                  const ContactItem(
                    icon: Icons.phone,
                    title: AppStrings.phone,
                  ),

                  const SizedBox(height: 15),

                  const ContactItem(
                    icon: Icons.location_on,
                    title: AppStrings.location,
                  ),

                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    alignment: WrapAlignment.center,
                    children: [

                      CustomButton(
                        title: "Email Me",
                        onTap: _launchEmail,
                      ),

                      CustomButton(
                        title: "LinkedIn",
                        isPrimary: false,
                        onTap: _launchLinkedIn,
                      ),

                      CustomButton(
                        title: "GitHub",
                        isPrimary: false,
                        onTap: _launchGitHub,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 60),

          Text(
            "© 2026 Manish Mevasiya",
            style: TextStyle(
              color: Colors.white.withOpacity(.5),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}