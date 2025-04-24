import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/common/bloc/genric_cubit.dart';
import 'package:netfilx/common/bloc/genric_state.dart';
import 'package:netfilx/domain/tv/entity/tv_entity.dart';
import 'package:netfilx/domain/tv/usecase/get_popular_tv.dart';

import 'package:netfilx/presentation/home/widget/get_popular_tv.dart';
import 'package:netfilx/service_locator.dart';

class TvPopular extends StatelessWidget {
  const TvPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => GenricDataCubit()
          ..getData<List<TvEntity>>(sl<GetPopularTvUsecase>()),
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
                      return TvPopularCard(
                        tvEntity: state.data[index],
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
