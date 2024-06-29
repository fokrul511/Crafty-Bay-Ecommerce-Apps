
import 'package:get/get.dart';

import 'presentation/state_holders/category_list_controller.dart';
import 'presentation/state_holders/home_slider_controller.dart';
import 'presentation/state_holders/main_bottom_nav_bar_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());

  }
}
