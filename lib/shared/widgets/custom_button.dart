import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isPrimary;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          gradient: isPrimary ? const LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ) : null,
          color: isPrimary ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.primary,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}