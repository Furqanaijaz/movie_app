import 'package:flutter/material.dart';

class VideoVoteavg extends StatelessWidget {
  final double voteAvg;
  const VideoVoteavg({super.key, required this.voteAvg});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        Text(
          ' ' + voteAvg.toStringAsFixed(1),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
