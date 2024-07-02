import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:flutter/material.dart';

class WishButton extends StatelessWidget {
  const WishButton({
    super.key,
    this.showAddToWishList = true,
    this.isSelected = false,
    required this.onTap,
  });

  final bool showAddToWishList;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showAddToWishList,
      replacement: _getIConButton(Icons.delete_outline),
      child: InkWell(
        onTap: onTap,
        child: _getIConButton(_getIconData()),
      ),
    );
  }

  Widget _getIConButton(IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  IconData _getIconData() {
    return isSelected ? Icons.favorite : Icons.favorite_border_outlined;
  }
}
