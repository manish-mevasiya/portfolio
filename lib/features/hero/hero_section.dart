import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/responsive.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/glass_card.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchLinkedIn() async {
    final uri = Uri.parse(
      AppStrings.linkedIn,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile =
    Responsive.isMobile(context);

    return Container(
      constraints: BoxConstraints(
        // minHeight: MediaQuery.of(context).size.height,
        maxWidth: 1300,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 40,
      ),
      child: GlassCard(
        child: isMobile
            ? _mobileLayout()
            : _desktopLayout(),
      ),
    );
  }

  Widget _desktopLayout() {
    return Row(
      children: [
        /// Left Side
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Available Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.green),
                ),
                child: const Text(
                  "🟢 Available For Work",
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Hi, I'm",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 10),

              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  ).createShader(bounds);
                },
                child: const Text(
                  AppStrings.name,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 50,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Flutter Developer",
                      speed: const Duration(
                        milliseconds: 100,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TypewriterAnimatedText(
                      "Mobile App Developer",
                      speed: const Duration(
                        milliseconds: 100,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                AppStrings.about,
                style: TextStyle(
                  height: 1.8,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 35),

              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [

                  CustomButton(
                    title: "Download Resume",
                    onTap: (){},
                  ),

                  // const SizedBox(width: 15),

                  // CustomButton(
                  //   title: "LinkedIn",
                  //   isPrimary: false,
                  //   onTap: _launchLinkedIn,
                  // ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 40),

        /// Right Side

        Expanded(
          flex: 2,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                    LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(.4),
                        AppColors.secondary.withOpacity(.4),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(150),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 3,
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/profile.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      children: [

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(.15),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.green),
          ),
          child: const Text(
            "🟢 Available For Work",
          ),
        ),

        const SizedBox(height: 25),

        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              100,
            ),
            border: Border.all(
              color: AppColors.primary,
              width: 3,
            ),
            image:
            const DecorationImage(
              image: AssetImage(
                'assets/images/profile.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 25),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.secondary,
              ],
            ).createShader(bounds);
          },
          child: const Text(
            AppStrings.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight:
              FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          height: 50,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "Flutter Developer",
                speed:
                const Duration(
                  milliseconds: 100,
                ),
                textStyle:
                const TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.w600,
                ),
              ),
              TypewriterAnimatedText(
                "Mobile App Developer",
                speed:
                const Duration(
                  milliseconds: 100,
                ),
                textStyle:
                const TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          AppStrings.about,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 25),

        CustomButton(
          title: "Download Resume",
          onTap: (){},
        ),
      ],
    );
  }
}