import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImageCaruselSlider extends StatefulWidget {
  const ProductImageCaruselSlider({
    super.key,
  });

  @override
  State<ProductImageCaruselSlider> createState() =>
      _ProductImageCaruselSliderState();
}

class _ProductImageCaruselSliderState extends State<ProductImageCaruselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCarouselSlider(),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,

              child: _buildDotIndicator(),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
        viewportFraction: 1,
        onPageChanged: (index, _) {
          _selectedPageIndex.value = index;
        },
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                color: Colors.grey.shade200,
                width: MediaQuery.of(context).size.width,
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
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: i == currentPage ? AppColors.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: i == currentPage
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
