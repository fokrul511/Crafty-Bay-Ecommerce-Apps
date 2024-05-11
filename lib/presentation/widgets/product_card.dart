import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/images_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.showAddToWishList = true,
  });

  final bool showAddToWishList;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white,
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            _buildProductImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nike Sport shoe 320K Special Editon",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Wrap(
                    spacing: 5,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        "\$30",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Wrap(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text("3.4")
                        ],
                      ),
                      _buildAddToWishButton()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToWishButton() {
    return Visibility(
        visible: showAddToWishList,
        replacement: _getIConButton(Icons.delete_outline),
        child: _getIConButton(Icons.favorite_border_outlined));
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

  Widget _buildProductImage() {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AssetsPath.productDummyImagePng,
        ),
      ),
    );
  }
}
