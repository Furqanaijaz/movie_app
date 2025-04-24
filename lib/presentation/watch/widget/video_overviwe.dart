import 'package:flutter/material.dart';

class VideoOverviwe extends StatelessWidget {
  final String overviwe;
  const VideoOverviwe({super.key, required this.overviwe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overviwe",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          overviwe,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        )
      ],
    );
  }
}
