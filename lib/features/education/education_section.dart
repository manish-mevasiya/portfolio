import 'package:flutter/material.dart';

import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
            title: "Education",
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            child: GlassCard(
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  /// ICON

                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient:
                      const LinearGradient(
                        colors: [
                          Color(0xff3B82F6),
                          Color(0xff8B5CF6),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 25),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Text(
                          "Bachelor of Science in Information Technology",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Atmiya University",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "2021 - 2024",
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Completed Bachelor's degree in Information Technology with focus on software development, programming fundamentals, database systems and modern application development.",
                          style: TextStyle(
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
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