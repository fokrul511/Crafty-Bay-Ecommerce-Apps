import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
  }
}
