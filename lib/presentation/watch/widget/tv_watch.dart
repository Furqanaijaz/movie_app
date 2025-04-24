import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/presentation/watch/bloc/trailer_state.dart';
import 'package:netfilx/presentation/watch/bloc/tv_trailer_cubit.dart';
import 'package:netfilx/presentation/watch/bloc/tv_trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvVideoPlayer extends StatelessWidget {
  final int id;
  const TvVideoPlayer({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TvTrailerCubit()..getTvTrailer(id),
        child: BlocBuilder<TvTrailerCubit, TvTrailerState>(
          builder: (context, state) {
            if (state is TrailerLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TvTrailerLoadedState) {
              return YoutubePlayer(
                controller: state.youtubePlayerController,
                showVideoProgressIndicator: true,
              );
            }
            if (state is TvTrailerErrorState) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ));
  }
}
