import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoadingState extends TrailerState {}

class TrailerLoadedState extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoadedState({required this.youtubePlayerController});
}

class TrailerErrorState extends TrailerState {
  final String error;

  TrailerErrorState({required this.error});
}
