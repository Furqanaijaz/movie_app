import 'package:flutter/material.dart';

class VideoReleasedate extends StatelessWidget {
  final DateTime releasedate;
  const VideoReleasedate({super.key, required this.releasedate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          ' ${releasedate.toString().split(" ")[0]}',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
