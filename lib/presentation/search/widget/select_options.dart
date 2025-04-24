import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/presentation/search/bloc/search_cubit.dart';
import 'package:netfilx/presentation/search/bloc/selectable_cubit.dart';
import 'package:netfilx/presentation/search/widget/seledt_option.dart';

class SelectOptions extends StatelessWidget {
  const SelectOptions({super.key});

  @override
  Widget build(BuildContext context) {
//     return BlocBuilder<SelectableCubit, SearchType>(
//       builder: (context, state) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SelectableOption(
//                 title: "Movies",
//                 isSelected:
//                     context.read<SelectableCubit>().state == SearchType.movie,
//                 onTap: () {
//                   context.read<SelectableCubit>().selectMovie();
//                   context.read<SearchCubit>().search(
//                       context.read<SearchCubit>().textEditingController.text,
//                       context.read<SelectableCubit>().state);
//                 }),
//             SelectableOption(
//                 title: "Tv",
//                 isSelected:
//                     context.read<SelectableCubit>().state == SearchType.tv,
//                 onTap: () {
//                   context.read<SelectableCubit>().selectTv();
//                   context.read<SearchCubit>().search(
//                       context.read<SearchCubit>().textEditingController.text,
//                       context.read<SelectableCubit>().state);
//                 }),
//           ],
//         );
//       },
//     );
//   }
// }

    return BlocBuilder<SelectableCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              isSelected:
                  context.read<SelectableCubit>().state == SearchType.movie,
              title: "Movie",
              onTap: () {
                context.read<SelectableCubit>().selectMovie();
                context.read<SearchCubit>().search(
                    context.read<SearchCubit>().textEditingController.text,
                    context.read<SelectableCubit>().state);
              },
            ),
            SelectableOption(
              isSelected:
                  context.read<SelectableCubit>().state == SearchType.tv,
              title: "Tv",
              onTap: () {
                context.read<SelectableCubit>().selectTv();
                context.read<SearchCubit>().search(
                    context.read<SearchCubit>().textEditingController.text,
                    context.read<SelectableCubit>().state);
              },
            )
          ],
        );
      },
    );
  }
}
