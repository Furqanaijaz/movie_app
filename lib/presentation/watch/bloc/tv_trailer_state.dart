import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TvTrailerState {}

class TvTrailerLoadingState extends TvTrailerState {}

class TvTrailerLoadedState extends TvTrailerState {
  final YoutubePlayerController youtubePlayerController;

  TvTrailerLoadedState({required this.youtubePlayerController});
}

class TvTrailerErrorState extends TvTrailerState {
  final String error;

  TvTrailerErrorState({required this.error});
}
