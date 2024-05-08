import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:flutter/material.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16)),
          child: const Icon(
            Icons.desktop_mac_outlined,
            size: 40,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Electronics",
          style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              letterSpacing: 0.4,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
