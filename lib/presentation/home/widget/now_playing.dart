import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/common/bloc/genric_cubit.dart';
import 'package:netfilx/common/bloc/genric_state.dart';
import 'package:netfilx/domain/movies/entity/movie_enitity.dart';
import 'package:netfilx/domain/movies/usecase/getNowPlayingMovie.dart';
import 'package:netfilx/presentation/home/widget/movie_card.dart';
import 'package:netfilx/service_locator.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => GenricDataCubit()
          ..getData<List<MovieEnitity>>(sl<GetnowplayingmovieUseCase>()),
        child: BlocBuilder<GenricDataCubit, GenricDataState>(
          builder: (context, state) {
            if (state is DataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DataLoadedState) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: state.data.length),
              );
            }
            if (state is DataErrorState) {
              return Text(state.error);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
