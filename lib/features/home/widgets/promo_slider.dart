import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop/common/widgets/customShapes/containers/circular_container.dart';
import 'package:e_shop/common/widgets/images/erounded_image.dart';
import 'package:e_shop/features/home/bloc/carousl_slider_bloc.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EPromoSlider extends StatelessWidget {
  final List<String> images;

  const EPromoSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouslSliderBloc(),
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    context.read<CarouslSliderBloc>().add(SliderEvent(index));
                  },
                ),
                items: images.map((imageUrl) {
                  return ERoundedImage(
                    imageUrl: imageUrl,
                    backgroundColor: EColors.light,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    borderRadius: ESizs.cardRadiusLg,
                  );
                }).toList(),
              ),

              const SizedBox(height: ESizs.spaceBtwItems),

              /// Dot Indicators
              BlocBuilder<CarouslSliderBloc, CarouslSliderState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (index) {
                      return ECircularContaiiner(
                        width: 20,
                        height: 4,
                        radius: 4,
                        color: index == state.index
                            ? EColors.primary
                            : EColors.grey,
                        margin: const EdgeInsets.only(
                          right: ESizs.spaceBtwItems,
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
