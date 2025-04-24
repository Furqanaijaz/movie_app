import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/common/bloc/genric_cubit.dart';
import 'package:netfilx/common/bloc/genric_state.dart';
import 'package:netfilx/core/entity/keyword_entity.dart';
import 'package:netfilx/domain/tv/usecase/getTvKeywords.dart';

class TvKeywords extends StatelessWidget {
  final int tvId;

  const TvKeywords({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenricDataCubit()
        ..getData<List<KeywordEntity>>(GettvkeywordsUseCase(), params: tvId),
      child: BlocBuilder<GenricDataCubit, GenricDataState>(
        builder: (context, state) {
          if (state is DataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DataLoadedState) {
            List<KeywordEntity> keyword = state.data;
            return Wrap(
              children:
                  keyword.map((item) => Chip(label: Text(item.name!))).toList(),
            );
          }
          if (state is DataErrorState) {
            return Text(state.error);
          }
          return Container();
        },
      ),
    );
  }
}
