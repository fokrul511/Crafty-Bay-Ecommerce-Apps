import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:flutter/material.dart';

class HomeCaruselSlider extends StatefulWidget {
  const HomeCaruselSlider({
    super.key,
  });

  @override
  State<HomeCaruselSlider> createState() => _HomeCaruselSliderState();
}

class _HomeCaruselSliderState extends State<HomeCaruselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(height: 4),
        _buildDotIndicator()
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
        options: CarouselOptions(
          height: 180.0,
          viewportFraction: 1,
          onPageChanged: (index, _) {
            _selectedPageIndex.value = index;
          },
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
      );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  height: 15,
                  width: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: i == currentPage ? AppColors.primaryColor : null,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: i == currentPage
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
