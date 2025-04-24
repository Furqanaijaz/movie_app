// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netfilx/presentation/home/widget/get_popular_tv.dart';
// import 'package:netfilx/presentation/home/widget/movie_card.dart';
// import 'package:netfilx/presentation/search/bloc/search_cubit.dart';
// import 'package:netfilx/presentation/search/bloc/search_state.dart';

// class SearchContent extends StatelessWidget {
//   const SearchContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchCubit, SearchState>(
//       builder: (context, state) {
//         if (state is SearchLoadingState) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (state is SearchMovieLoadedState) {
//           return GridView.builder(
//             itemCount: state.movie.length,
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.6),
//             itemBuilder: (context, index) {
//               return MovieCard(movieEntity: state.movie[index]);
//             },
//           );
//         }
//         if (state is SearchTvLoadedState) {
//           return GridView.builder(
//             itemCount: state.tvs.length,
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.6),
//             itemBuilder: (context, index) {
//               return TvPopularCard(tvEntity: state.tvs[index]);
//             },
//           );
//         }
//         if (state is SearchErroeState) {
//           return Text(
//             state.error,
//           );
//         }
//         return Container();
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/presentation/home/widget/get_popular_tv.dart';
import 'package:netfilx/presentation/home/widget/movie_card.dart';
import 'package:netfilx/presentation/search/bloc/search_cubit.dart';
import 'package:netfilx/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SearchMovieLoadedState) {
          return GridView.builder(
            itemCount: state.movie.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movie[index]);
            },
          );
        }
        if (state is SearchTvLoadedState) {
          return GridView.builder(
            itemCount: state.tvs.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return TvPopularCard(tvEntity: state.tvs[index]);
            },
          );
        }
        if (state is SearchErroeState) {
          return Text(state.error);
        }
        return Container();
      },
    );
  }
}
