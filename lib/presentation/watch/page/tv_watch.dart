import 'package:flutter/material.dart';
import 'package:netfilx/common/widgets/appbar/app_bar.dart';
import 'package:netfilx/domain/tv/entity/tv_entity.dart';
import 'package:netfilx/presentation/watch/widget/recommendation_tv.dart';
import 'package:netfilx/presentation/watch/widget/similar_tv.dart';
import 'package:netfilx/presentation/watch/widget/tv_keywords.dart';
import 'package:netfilx/presentation/watch/widget/tv_watch.dart';
import 'package:netfilx/presentation/watch/widget/video_overviwe.dart';
import 'package:netfilx/presentation/watch/widget/video_releaseDate.dart';
import 'package:netfilx/presentation/watch/widget/video_title.dart';
import 'package:netfilx/presentation/watch/widget/video_vote+avg.dart';

class TvWatchPage extends StatelessWidget {
  final TvEntity tvEntity;
  const TvWatchPage({required this.tvEntity, super.key});

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
            TvVideoPlayer(id: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(title: tvEntity.name!),
            TvKeywords(tvId: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleasedate(releasedate: tvEntity.firstAirDate!),
                VideoVoteavg(voteAvg: tvEntity.voteAverage!)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverviwe(overviwe: tvEntity.overview!),
            const SizedBox(
              height: 10,
            ),
            RecommendationTv(
              tvId: tvEntity.id!,
            ),
            const SizedBox(
              height: 10,
            ),
            SimilarTv(tvId: tvEntity.id!)
          ],
        ),
      ),
    );
  }
}
