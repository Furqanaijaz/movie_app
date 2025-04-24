import 'package:flutter/material.dart';
import 'package:netfilx/common/widgets/appbar/app_bar.dart';
import 'package:netfilx/domain/movies/entity/movie_enitity.dart';
import 'package:netfilx/presentation/watch/widget/movie_watch.dart';
import 'package:netfilx/presentation/watch/widget/recommendation.dart';
import 'package:netfilx/presentation/watch/widget/similar_movies.dart';
import 'package:netfilx/presentation/watch/widget/video_overviwe.dart';
import 'package:netfilx/presentation/watch/widget/video_releaseDate.dart';
import 'package:netfilx/presentation/watch/widget/video_title.dart';
import 'package:netfilx/presentation/watch/widget/video_vote+avg.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEnitity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleasedate(releasedate: movieEntity.releaseDate!),
                VideoVoteavg(voteAvg: movieEntity.voteAverage!)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverviwe(overviwe: movieEntity.overview!),
            const SizedBox(
              height: 10,
            ),
            RecommendationMovies(
              movieId: movieEntity.id!,
            ),
            const SizedBox(
              height: 10,
            ),
            SimilarMovies(movieId: movieEntity.id!)
          ],
        ),
      ),
    );
  }
}
