import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/core/entity/trailer.dart';
import 'package:netfilx/domain/movies/usecase/get_trailer.dart';
import 'package:netfilx/presentation/watch/bloc/trailer_state.dart';
import 'package:netfilx/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoadingState());
  void getTrailer(int movieId) async {
    var returnedData = await sl<GetTrailerUseCase>().call(params: movieId);

    returnedData.fold((error) {
      emit(TrailerErrorState(error: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      emit(TrailerLoadedState(youtubePlayerController: controller));
    });
  }
}
