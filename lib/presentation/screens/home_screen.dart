import 'package:crafty_bay_ecomarc_apps/data/models/slider_data.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/images_path.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/category_item.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/home_carusel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/product_card.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/models/category_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return SizedBox(
                    height: 200,
                    child: CentredCircularProgressIndicator(),
                  );
                }
                return HomeCarouselSlider(
                  sliderList: sliderController.sliderList,
                );
              }),
              SectionHeader(
                title: 'All Catagory',
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController> ().selectCategory();
                },
              ),
              const SizedBox(height: 10),
              GetBuilder<CategoryListController>(
                builder: (categoryListController) {
                  if (categoryListController.inProgress) {
                    return SizedBox(
                      height: 120,
                      child: CentredCircularProgressIndicator(),
                    );
                  }
                  return _buildCategoryListView(categoryListController.categoryList);
                }
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              _buildProductListView(),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              _buildProductListView(),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              _buildProductListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(List <Category> categoryList) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return  CategoryItem(category: categoryList[index],);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }

  Widget _buildProductListView() {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return const ProductCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppbarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppbarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppbarIconButton(
          icon: Icons.notifications_on,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController;
    super.dispose();
  }
}
