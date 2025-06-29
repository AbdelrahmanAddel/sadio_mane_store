import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_admin_app_bar.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: CustomAdminAppBar(
        backGrounfColor: Colors.black,
        title: 'Second Screen',
        isMain: true,
      ),
    );
  }
}
