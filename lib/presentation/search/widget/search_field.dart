import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/presentation/search/bloc/search_cubit.dart';
import 'package:netfilx/presentation/search/bloc/selectable_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().textEditingController,
      onChanged: (value) {
        context
            .read<SearchCubit>()
            .search(value, context.read<SelectableCubit>().state);
      },
      decoration: InputDecoration(hintText: "Search.."),
    );
  }
}
