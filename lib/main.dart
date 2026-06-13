import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'core/theme/app_theme.dart';
import 'home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const PortfolioApp());
  //   runApp(const MyPortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manish Mevasiya',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manish Mevasiya | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0A192F),
        scaffoldBackgroundColor: const Color(0xFF0A192F),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF64FFDA), // Teal accent
          secondary: Color(0xFF112240), // Card background
          surface: Color(0xFF0A192F),
        ),
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({Key? key}) : super(key: key);

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 850;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A192F).withOpacity(0.9),
        elevation: 0,
        title: Text(
          'MM.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: isMobile
            ? null
            : [
          _navButton('Home', () => _scrollToSection(_homeKey)),
          _navButton('Skills', () => _scrollToSection(_skillsKey)),
          _navButton('Projects', () => _scrollToSection(_projectsKey)),
          _navButton('Experience', () => _scrollToSection(_experienceKey)),
          const SizedBox(width: 20),
        ],
      ),
      drawer: isMobile
          ? Drawer(
        backgroundColor: const Color(0xFF112240),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0A192F)),
              child: Center(
                child: Text(
                  'Manish Mevasiya\nFlutter Developer',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            _drawerItem('Home', () {
              Navigator.pop(context);
              _scrollToSection(_homeKey);
            }),
            _drawerItem('Skills', () {
              Navigator.pop(context);
              _scrollToSection(_skillsKey);
            }),
            _drawerItem('Projects', () {
              Navigator.pop(context);
              _scrollToSection(_projectsKey);
            }),
            _drawerItem('Experience', () {
              Navigator.pop(context);
              _scrollToSection(_experienceKey);
            }),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Profile / Hero Section
            Container(key: _homeKey, child: _buildHeroSection(isMobile)),
            const SizedBox(height: 80),

            // Skills Section
            Container(key: _skillsKey, child: _buildSkillsSection(context, isMobile)),
            const SizedBox(height: 80),

            // Projects Section
            Container(key: _projectsKey, child: _buildProjectsSection(context, isMobile)),
            const SizedBox(height: 80),

            // Experience Section
            Container(key: _experienceKey, child: _buildExperienceSection(context, isMobile)),
            const SizedBox(height: 100),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _drawerItem(String text, VoidCallback onTap) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  // --- 1. HERO SECTION ---
  Widget _buildHeroSection(bool isMobile) {
    final content = [
      // Left side text
      Expanded(
        flex: isMobile ? 0 : 3,
        child: Column(
          crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, my name is',
              style: TextStyle(color: Colors.tealAccent[400], fontSize: 16, letterSpacing: 2),
            ),
            const SizedBox(height: 10),
            Text(
              'Manish Mevasiya',
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Flutter Developer (2+ Years Experience)',
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: const TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Text(
              'I build high-performance cross-platform mobile applications using Flutter and Dart. Experienced in developing scalable apps, integrating REST APIs, and deploying production apps to Google Play Store & Apple App Store.',
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
              children: [
                ElevatedButton.icon(
                  onPressed: () {}, // Handle contact or mailto
                  icon: const Icon(Icons.email, color: Colors.black),
                  label: const Text('Contact Me', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF64FFDA),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {}, // Handle resume download link
                  icon: const Icon(FontAwesomeIcons.linkedin, size: 18),
                  label: const Text('LinkedIn Profile'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF64FFDA),
                    side: const BorderSide(color: Color(0xFF64FFDA)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      if (!isMobile) const SizedBox(width: 40),
      // Right side Profile Image
      Center(
        child: Container(
          width: isMobile ? 220 : 280,
          height: isMobile ? 220 : 280,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF64FFDA), width: 4),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF64FFDA).withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              )
            ],
            image: const DecorationImage(
              fit: BoxFit.cover,
              // Replace with your real hosting asset link or local asset path
              image: AssetImage('assets/images/profile.png'),
            ),
          ),
        ),
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 60),
      constraints: const BoxConstraints(minHeight: 500),
      child: isMobile
          ? Column(
        children: [
          content[1], // Image first on mobile
          const SizedBox(height: 40),
          content[0], // Text second
        ],
      )
          : Row(children: content),
    );
  }

  // --- 2. SKILLS SECTION ---
  Widget _buildSkillsSection(BuildContext context, bool isMobile) {
    final Map<String, IconData> skills = {
      'Flutter': Icons.phone_android,
      'Dart': Icons.code,
      'Java': FontAwesomeIcons.java,
      'GetX': Icons.bolt,
      'Provider': Icons.layers,
      'REST APIs': Icons.cloud_sync,
      'SQLite': Icons.storage,
      'Firebase': FontAwesomeIcons.fire,
      'Git & GitHub': FontAwesomeIcons.github,
      'Android & iOS': Icons.devices,
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('My Technical Toolkit'),
          const SizedBox(height: 30),
          Center(
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: skills.entries.map((entry) {
                return Chip(
                  backgroundColor: const Color(0xFF112240),
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  avatar: Icon(entry.value, color: const Color(0xFF64FFDA), size: 18),
                  label: Text(
                    entry.key,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // --- 3. PROJECTS SECTION ---
  Widget _buildProjectsSection(BuildContext context, bool isMobile) {
    final projects = [
      {
        'title': 'Online Exam Software - CE',
        'desc': 'Developed a cross-platform Online Exam Application with features such as user authentication, test creation, and real-time result processing. Integrated REST APIs for dynamic data handling, optimized the UI for high-performance and published to Play Store and App Store.',
        'tech': 'Flutter, Dart, GetX, REST APIs',
        'image': 'assets/images/profile.png'
      },
      {
        'title': 'Event Management System',
        'desc': 'Built a user-friendly event management app featuring secure login and personalized access controls. Implemented structured routing for seamlessly navigating events, sub-events, and tasks. Built with highly modular reusable components.',
        'tech': 'Flutter, Dart, Provider, Modular UI',
        'image': 'assets/images/profile.png'
      }
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Featured Projects'),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio: isMobile ? 0.8 : 0.85,
            ),
            itemBuilder: (context, index) {
              final proj = projects[index];
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF112240),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                // overflow: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        color: Colors.black12,
                        child: Image.network(
                          proj['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.broken_image, size: 50)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  proj['title']!,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  proj['desc']!,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 13, color: Colors.white70, height: 1.4),
                                ),
                              ],
                            ),
                            Text(
                              proj['tech']!,
                              style: const TextStyle(fontSize: 12, color: Color(0xFF64FFDA), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  // --- 4. EXPERIENCE SECTION ---
  Widget _buildExperienceSection(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Professional Journey'),
          const SizedBox(height: 30),
          _timelineTile(
            role: 'Flutter Developer',
            company: 'Conduct Exam Technologies LLP',
            period: 'April 2024 - March 2026',
            points: [
              'Developed and maintained cross-platform mobile applications using Flutter and Dart.',
              'Integrated REST APIs and managed state using GetX for efficient runtime performance.',
              'Successfully deployed updates and production builds to Play Store and Apple App Store.',
              'Improved performance and code quality by aggressively refactoring Legacy codebases.'
            ],
          ),
          const SizedBox(height: 20),
          _timelineTile(
            role: 'Flutter Intern',
            company: 'Conduct Exam Technologies LLP',
            period: 'April 2024 - September 2024',
            points: [
              'Learned and implemented Flutter fundamentals to build responsive and fluid application UI elements.',
              'Worked with core database engines like SQLite, REST APIs and Firebase pipelines.',
              'Assisted senior engineers in squashing priority bugs on live infrastructure.'
            ],
          ),
        ],
      ),
    );
  }

  Widget _timelineTile({
    required String role,
    required String company,
    required String period,
    required List<String> points,
  }) {
    return Card(
      color: const Color(0xFF112240),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // transformConstraints: false,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('$role @ $company',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                Text(period, style: const TextStyle(color: Color(0xFF64FFDA), fontSize: 13)),
              ],
            ),
            const Divider(color: Colors.white12, height: 25),
            Column(
              children: points
                  .map((pt) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('▹ ', style: TextStyle(color: Color(0xFF64FFDA), fontSize: 16)),
                    Expanded(child: Text(pt, style: const TextStyle(color: Colors.white70, fontSize: 14))),
                  ],
                ),
              ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(width: 15),
        const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
      ],
    );
  }

  // --- 5. FOOTER ---
  Widget _buildFooter() {
    return Container(
      color: const Color(0xFF020C1B),
      padding: const EdgeInsets.all(24),
      child: const Center(
        child: Text(
          'Designed & Built by Manish Mevasiya • 2026\nRajkot, Gujarat, India',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
        ),
      ),
    );
  }
}