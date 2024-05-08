import 'package:crafty_bay_ecomarc_apps/presentation/utility/images_path.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/category_item.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/home_carusel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/product_card.dart';

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
              const HomeCaruselSlider(),
              SectionHeader(
                title: 'All Catagory',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildCategoryListView(),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return const CategoryCardItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
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
