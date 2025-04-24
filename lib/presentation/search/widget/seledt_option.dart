// import 'package:flutter/widgets.dart';
// import 'package:netfilx/core/config/theme/app_colors.dart';

// class SelectableOption extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final VoidCallback onTap;
//   const SelectableOption(
//       {super.key,
//       required this.title,
//       required this.isSelected,
//       required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 40,
//         width: 80,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: isSelected ? AppColors.primary : AppColors.secondBackground),
//         child: Center(
//           child: Text(title),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:netfilx/core/config/theme/app_colors.dart';

class SelectableOption extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  const SelectableOption(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.secondBackground,
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
