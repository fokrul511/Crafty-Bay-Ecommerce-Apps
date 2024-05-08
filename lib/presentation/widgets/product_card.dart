import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/images_path.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      fontSize: 16,
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
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color: AppColors.primaryColor,
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      )
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
        child: Image.asset(AssetsPath.productDummyImagePng),
      ),
    );
  }
}
