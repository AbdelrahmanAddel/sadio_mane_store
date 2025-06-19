import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.assetsImagesPngNoNetwork, fit: BoxFit.fill);
  }
}
