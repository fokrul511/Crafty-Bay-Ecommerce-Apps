import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/add_to_wish_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/product_list_by_categroy_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/category_list_controller.dart';
import 'presentation/state_holders/home_slider_controller.dart';
import 'presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'presentation/state_holders/verify_email_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(EmailVerifayController());
    Get.put(VerifyOtpController());
    Get.put(AddToWishListController());
  }
}
