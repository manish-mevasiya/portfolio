import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class GlassNavbar extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const GlassNavbar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {

    final isMobile =
        MediaQuery.of(context).size.width < 768;

    if (isMobile) {
      return Positioned(
        top: 20,
        left: 20,
        right: 20,
        child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.menu,color: Colors.transparent,),
            onPressed: () {},
          ),
        ),
      );
    }

    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Center(
        child: ClipRRect(
          borderRadius:
          BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: Container(
              constraints:
              const BoxConstraints(
                maxWidth: 900,
              ),
              padding:
              const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(.05),
                borderRadius:
                BorderRadius.circular(
                  50,
                ),
                border: Border.all(
                  color: Colors.white12,
                ),
              ),
              child: Row(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  NavItem(
                    title: "Home",
                    isSelected:
                    selectedIndex == 0,
                    onTap: () =>
                        onTap(0),
                  ),

                  // NavItem(
                  //   title: "About",
                  //   isSelected: selectedIndex == 1,
                  //   onTap: () => onTap(1),
                  // ),

                  NavItem(
                    title: "Skills",
                    isSelected:
                    selectedIndex == 2,
                    onTap: () =>
                        onTap(2),
                  ),

                  NavItem(
                    title: "Experience",
                    isSelected:
                    selectedIndex == 3,
                    onTap: () =>
                        onTap(3),
                  ),

                  NavItem(
                    title: "Projects",
                    isSelected:
                    selectedIndex == 4,
                    onTap: () =>
                        onTap(4),
                  ),

                  NavItem(
                    title: "Contact",
                    isSelected:
                    selectedIndex == 5,
                    onTap: () =>
                        onTap(5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      child: InkWell(
        borderRadius:
        BorderRadius.circular(30),
        onTap: onTap,
        child: AnimatedContainer(
          duration:
          const Duration(
            milliseconds: 250,
          ),
          padding:
          const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              30,
            ),
            gradient: isSelected
                ? const LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.secondary,
              ],
            )
                : null,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight:
              FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}