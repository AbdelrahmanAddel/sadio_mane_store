import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/home_view_body.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/home_view_floating_action_buttons.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Stack(
        children: [
          HomeViewBody(scrollController: scrollController),
          HomeViewFloatingActionButton(scrollController: scrollController),
        ],
      ),
    );
  }
}
