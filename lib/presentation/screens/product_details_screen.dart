import 'package:crafty_bay_ecomarc_apps/data/models/cart_model.dart';
import 'package:crafty_bay_ecomarc_apps/data/models/product_details_model.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/screens/review_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/color_picker.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/product_image_carusel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/size_picker.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _countValue = 1;

  String? _selectColor;
  String? _selectSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CentredCircularProgressIndicator();
        }
        ProductDetailsModel productDetails =
            productDetailsController.productDetailsModel;
        List<String> colors = productDetails.color?.split(',') ?? [];
        List<String> size = productDetails.size?.split(',') ?? [];
        _selectColor = colors.first;
        _selectSize = size.first;
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImageCaruselSlider(
                      images: [
                        productDetails.img1 ?? '',
                        productDetails.img2 ?? '',
                        productDetails.img3 ?? '',
                        productDetails.img4 ?? '',
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  productDetails.product!.title ?? '',
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
                          _buildReviewSection(productDetails),
                          const Text(
                            "Color",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizePicker(
                            size: colors,
                            onChnage: (String c) {
                              _selectColor = c;
                            },
                            isRounded: false,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Size",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizePicker(
                            size: size,
                            onChnage: (String s) {
                              _selectSize = s;
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(productDetails.product!.shortDes ?? ''),
                          const SizedBox(height: 16),
                          Text(productDetails.des ?? ''),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            _buildAddtoCartSection(productDetails),
          ],
        );
      }),
    );
  }

  Widget _buildAddtoCartSection(ProductDetailsModel productDetails) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPrice(productDetails),
          SizedBox(
            width: 100,
            child: GetBuilder<AddToCartController>(
              builder: (addToCartcontroller) {
                if(addToCartcontroller.inProgress){
                  return const CentredCircularProgressIndicator();
                }
                return ElevatedButton(
                  child: const Text("Add to Cart"),
                  onPressed: () {
                    CartModel cartModel = CartModel(
                        product_id: widget.productId,
                        color: _selectColor ?? '',
                        size: _selectSize ?? '',
                        quantity: _countValue);

                    addToCartcontroller.addToCart(cartModel);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPrice(ProductDetailsModel productDetails) {
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
          "\$${productDetails.product?.price ?? 0}",
          style: TextStyle(
            fontSize: 24,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text("${productDetails.product?.star ?? 0}")
          ],
        ),
        TextButton(
            onPressed: () {
              Get.to(() => const ReviewScreen());
            },
            child: const Text('Reviews')),
        const WishButton(
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
