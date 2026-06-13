import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          padding: padding ??
              const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.glass,
            borderRadius:
            BorderRadius.circular(
              borderRadius,
            ),
            border: Border.all(
              color:
              AppColors.glassBorder,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary
                    .withOpacity(0.12),
                blurRadius: 30,
                spreadRadius: 1,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}