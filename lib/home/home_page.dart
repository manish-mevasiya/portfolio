import 'package:flutter/material.dart';

import '../features/about/about_section.dart';
import '../features/contact/contact_section.dart';
import '../features/education/education_section.dart';
import '../features/experience/experience_section.dart';
import '../features/hero/hero_section.dart';
import '../features/projects/projects_section.dart';
import '../features/skills/skills_section.dart';
import '../features/stats/stats_section.dart';
import '../shared/widgets/glass_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  final ScrollController controller =
  ScrollController();

  int selectedIndex = 0;

  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration:
      const Duration(
        milliseconds: 800,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// Background Effects

          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue
                    .withOpacity(.15),
              ),
            ),
          ),

          Positioned(
            right: -150,
            top: 250,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple
                    .withOpacity(.15),
              ),
            ),
          ),

          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [

                SizedBox(
                  key: heroKey,
                  child:
                  const HeroSection(),
                ),

                // const StatsSection(),

                // SizedBox(
                //   key: aboutKey,
                //   child:
                //   const AboutSection(),
                // ),

                SizedBox(
                  key: skillsKey,
                  child:
                  const SkillsSection(),
                ),

                SizedBox(
                  key: experienceKey,
                  child: const ExperienceSection(),
                ),

                SizedBox(
                  key: projectsKey,
                  child:
                  const ProjectsSection(),
                ),

                const EducationSection(),

                SizedBox(
                  key: contactKey,
                  child:
                  const ContactSection(),
                ),
              ],
            ),
          ),

          GlassNavbar(
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });

              switch (index) {
                case 0:
                  scrollTo(heroKey);
                  break;

                case 1:
                  scrollTo(aboutKey);
                  break;

                case 2:
                  scrollTo(skillsKey);
                  break;

                case 3:
                  scrollTo(
                    experienceKey,
                  );
                  break;

                case 4:
                  scrollTo(projectsKey);
                  break;

                case 5:
                  scrollTo(contactKey);
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}