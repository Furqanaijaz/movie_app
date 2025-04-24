// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netfilx/common/navigation/app_navigation.dart';
import 'package:netfilx/common/widgets/appbar/app_bar.dart';
import 'package:netfilx/core/config/assets/app_vectors.dart';
import 'package:netfilx/presentation/home/widget/category_text.dart';
import 'package:netfilx/presentation/home/widget/now_playing.dart';
import 'package:netfilx/presentation/home/widget/trending_slideer.dart';
import 'package:netfilx/presentation/home/widget/tv_popular_widget_call.dart';
import 'package:netfilx/presentation/search/page/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        action: IconButton(
            onPressed: () {
              AppNavigator.push(context, SearchPage());
            },
            icon: Icon(Icons.search)),
        height: 25,
        hideBack: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: SingleChildScrollView(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(
                title: "Trendings",
              ),
              TrendingSlideer(),
              SizedBox(
                height: 10,
              ),
              CategoryText(
                title: "Now Plating",
              ),
              SizedBox(
                height: 10,
              ),
              NowPlayingMovies(),
              SizedBox(
                height: 10,
              ),
              CategoryText(title: "Popular Tv Shows"),
              SizedBox(
                height: 10,
              ),
              TvPopular(),
            ],
          ),
        ),
      ),
    );
  }
}
