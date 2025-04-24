import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/core/entity/trailer.dart';
import 'package:netfilx/domain/tv/usecase/get_tv_trailer.dart';
import 'package:netfilx/presentation/watch/bloc/tv_trailer_state.dart';
import 'package:netfilx/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvTrailerCubit extends Cubit<TvTrailerState> {
  TvTrailerCubit() : super(TvTrailerLoadingState());
  void getTvTrailer(int tvId) async {
    var returnedData = await sl<GetTvTrailerUsecase>().call(params: tvId);

    returnedData.fold((error) {
      emit(TvTrailerErrorState(error: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      emit(TvTrailerLoadedState(youtubePlayerController: controller));
    });
  }
}
