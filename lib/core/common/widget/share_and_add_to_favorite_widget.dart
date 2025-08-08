import 'package:flutter/material.dart';

class ShareAndAddToFavoriteWidget extends StatelessWidget {
  const ShareAndAddToFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.share_rounded),
        Icon(Icons.favorite_border_rounded),
      ],
    );
  }
}
