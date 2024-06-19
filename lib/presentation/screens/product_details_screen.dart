import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/color_picker.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/product_image_carusel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/size_picker.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _countValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageCaruselSlider(),
            SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Nike Shoe 2024 Latest Edition 80AFDR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
                _buildCounter(),
              ],
            ),
            _buildReviewSection(),
            Text(
              "Color",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16,),
            ColorPicker(colors: [
              Colors.black,
              Colors.red,
              Colors.amber,
              Colors.blue,
              Colors.purple,
            ], onChnage: (Color selectedColor) {
              print(selectedColor);
            }), SizedBox(height: 16,),
            SizePicker(size: ['M', 'L', 'XL', 'XXl',], onChnage:(String s){

            })
          ],
        ),
      ),
    );
  }

  Widget _buildReviewSection() {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
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
        TextButton(onPressed: () {}, child: Text('Reviews')),
        WishButton(
          showAddToWishList: true,
        )
      ],
    );
  }

  Widget _buildCounter() {
    return ItemCount(
      initialValue: _countValue,
      minValue: 1,
      maxValue: 20,
      decimalPlaces: 0,
      color: AppColors.primaryColor,
      onChanged: (value) {
        _countValue = value as int;
        setState(() {});
      },
    );
  }
}

