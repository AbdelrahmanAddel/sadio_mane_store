import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.scrollController, super.key});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList.separated(
          itemCount: 300,
          itemBuilder: (context, index) {
            return Container(height: 100.h, color: Colors.red);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
        ),
      ],
    );
  }
}
