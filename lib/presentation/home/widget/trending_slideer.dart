import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/core/config/assets/app_images.dart';
import 'package:netfilx/presentation/home/bloc/trending_cubit.dart';
import 'package:netfilx/presentation/home/bloc/trending_state.dart';

class TrendingSlideer extends StatelessWidget {
  const TrendingSlideer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrending(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrendingLoadedState) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movie
                  .map((item) =>
                      AppImages.movieImageBasePath + item.posterPath.toString())
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 350,
              showIndicator: true,
            );
          }
          if (state is TrendingErrorState) {
            return Text(state.error);
          }
          return Container();
        },
      ),
    );
  }
}
