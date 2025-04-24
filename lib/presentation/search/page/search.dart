// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netfilx/common/widgets/appbar/app_bar.dart';
// import 'package:netfilx/presentation/search/bloc/search_cubit.dart';
// import 'package:netfilx/presentation/search/bloc/selectable_cubit.dart';
// import 'package:netfilx/presentation/search/widget/search_content.dart';
// import 'package:netfilx/presentation/search/widget/search_field.dart';
// import 'package:netfilx/presentation/search/widget/select_options.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BasicAppbar(
//         title: Text("Search"),
//       ),
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => SelectableCubit()),
//           BlocProvider(create: (context) => SearchCubit())
//         ],
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SearchField(),
//               SizedBox(
//                 height: 16,
//               ),
//               SelectOptions(),
//               SizedBox(
//                 height: 10,
//               ),
//               Expanded(child: SearchContent())
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/common/widgets/appbar/app_bar.dart';
import 'package:netfilx/presentation/search/bloc/search_cubit.dart';
import 'package:netfilx/presentation/search/bloc/selectable_cubit.dart';
import 'package:netfilx/presentation/search/widget/search_content.dart';
import 'package:netfilx/presentation/search/widget/search_field.dart';
import 'package:netfilx/presentation/search/widget/select_options.dart';
import 'package:netfilx/presentation/search/widget/seledt_option.dart';
import 'package:netfilx/presentation/watch/bloc/trailer_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text("Search"),
        hideBack: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectableCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          )
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SearchField(),
              SizedBox(
                height: 16,
              ),
              SelectOptions(),
              SizedBox(
                height: 16,
              ),
              Expanded(child: SearchContent())
            ],
          ),
        ),
      ),
    );
  }
}
