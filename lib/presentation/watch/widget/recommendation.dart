import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/common/bloc/genric_cubit.dart';
import 'package:netfilx/common/bloc/genric_state.dart';
import 'package:netfilx/domain/movies/usecase/get_recommendation_usecase.dart';
import 'package:netfilx/domain/tv/entity/tv_entity.dart';
import 'package:netfilx/presentation/home/widget/movie_card.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => GenricDataCubit()
          ..getData<List<TvEntity>>(GetRecommendationMoviesUseCase(),
              params: movieId),
        child: BlocBuilder<GenricDataCubit, GenricDataState>(
          builder: (context, state) {
            if (state is DataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DataLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recommendations",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
                  ),
                ],
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
