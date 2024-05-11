import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category"),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.75,
          ),
          itemCount: 25,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8),
              child: FittedBox(
                child: CategoryItem(),
              ),
            );
          },
        ),
      ),
    );
  }
}
