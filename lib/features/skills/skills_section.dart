import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../data/portfolio_data.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile =
    Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: "Technical Skills",
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              itemCount:
              PortfolioData.skills.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                isMobile ? 2 : 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2.5,
              ),
              itemBuilder:
                  (context, index) {
                return SkillCard(
                  skill:
                  PortfolioData.skills[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final String skill;

  const SkillCard({
    super.key,
    required this.skill,
  });

  @override
  State<SkillCard> createState() =>
      _SkillCardState();
}

class _SkillCardState
    extends State<SkillCard> {
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
          ..scale(
            isHover ? 1.05 : 1,
          ),
        child: GlassCard(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:
                Colors.white10,
                child: Text(
                  widget.skill[0],
                  style:
                  const TextStyle(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  widget.skill,
                  overflow:
                  TextOverflow.ellipsis,
                  style:
                  const TextStyle(
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}