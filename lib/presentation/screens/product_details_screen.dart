import 'package:crafty_bay_ecomarc_apps/presentation/screens/review_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/color_picker.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/product_image_carusel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/size_picker.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageCaruselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        SizedBox(
                          height: 16,
                        ),
                        ColorPicker(
                            colors: [
                              Colors.black,
                              Colors.red,
                              Colors.amber,
                              Colors.blue,
                              Colors.purple,
                            ],
                            onChnage: (Color selectedColor) {
                              print(selectedColor);
                            }),
                        SizedBox(height: 16),
                        Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16),
                        SizePicker(
                          size: ['S', 'M', 'L', 'XL', 'XXl'],
                          onChnage: (String s) {},
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                            '''To the thin asparagus add garlic, zucchini, tea and bloody tuna. To the thin asparagus add garlic, zucchini, tea and bloody tuna. To the thin asparagus add garlic, zucchini, tea and bloody tuna. To the thin asparagus add garlic, zucchini, tea and bloody tuna. To the thin asparagus add garlic, zucchini, tea and bloody tuna. To the thin asparagus add garlic, zucchini, tea and bloody tuna. To the thin asparagus add garlic, zucchini, tea and bloody tuna.
                                      
                        '''),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildAddtoCartSection(),
        ],
      ),
    );
  }

  Widget _buildAddtoCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPrice(),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              child: Text("Add to Cart"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          "\$12000",
          style: TextStyle(
            fontSize: 24,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
        TextButton(onPressed: () {
          Get.to(()=>ReviewScreen());
        }, child: Text('Reviews')),
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
