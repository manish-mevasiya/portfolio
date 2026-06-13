import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            title: "Projects",
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: [
                ProjectCard(
                  width: isMobile
                      ? MediaQuery.of(context).size.width - 40
                      : 550,
                  title: "Online Exam Software",
                  image: "assets/images/exam.png",
                  description: "A comprehensive white-label online examination application that enables students to take tests and exams directly from mobile devices. The platform provides instant result analysis, performance tracking, learning resources, and secure exam workflows.",
                  keyfeature: const[
                    "• Online examinations with section-wise timers and auto submission",
                    "• Instant result generation and detailed performance analysis",
                    "• Study materials, PDFs, and learning video access",
                    "• Face Login authentication",
                    "• Push notifications and announcements",
                    "• Question bookmarking for future review",
                    "• Cross-platform support for Android and iOS",
                    "• White-label architecture for multiple client deployments",
                  ],
                  technologies: const [
                    "Flutter",
                    "Dart",
                    "GetX",
                    "REST API",
                    "Firebase",
                  ],
                ),

                ProjectCard(
                  width: isMobile
                      ? MediaQuery.of(context).size.width - 40
                      : 550,
                  title: "Event Management System",
                  image: "assets/images/event.png",
                  description: "A mobile application designed to streamline event operations by managing events, sub-events, and task assignments. The platform helps teams efficiently coordinate responsibilities and track event-related activities.",
                  keyfeature: const[
                    "• Event and sub-event management",
                    "• Task assignment and tracking",
                    "• Secure user authentication",
                    "• Google Maps integration for event locations",
                    "• Role-based workflow management",
                    "• Real-time event coordination",
                  ],
                  technologies: const [
                    "Flutter",
                    "Dart",
                    "Provider",
                    "REST API",
                    "Google Map"
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

class ProjectCard extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final List<String> keyfeature;
  final List<String> technologies;
  final double width;

  const ProjectCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.keyfeature,
    required this.technologies,
    required this.width,
  });

  @override
  State<ProjectCard> createState() =>
      _ProjectCardState();
}

class _ProjectCardState
    extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 250),
        transform:
        Matrix4.identity()
          ..translate(
            0.0,
            isHover ? -10 : 0,
          ),
        width: widget.width,
        child: GlassCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// IMAGE

              ClipRRect(
                borderRadius:
                const BorderRadius.only(
                  topLeft:
                  Radius.circular(24),
                  topRight:
                  Radius.circular(24),
                ),
                child: Image.asset(
                  widget.image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding:
                const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      widget.description,
                      style:
                      const TextStyle(
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Text("key Feature"),
                    // ...List.generate(widget.keyfeature.length, (index) => Text(widget.keyfeature[index].toString()),),
                    // const SizedBox(height: 20),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                      widget.technologies
                          .map(
                            (tech) {
                          return Container(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration:
                            BoxDecoration(
                              color: Colors
                                  .white
                                  .withOpacity(
                                  .05),
                              borderRadius:
                              BorderRadius.circular(
                                  20),
                              border:
                              Border.all(
                                color: Colors
                                    .white12,
                              ),
                            ),
                            child: Text(
                              tech,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}