import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/build_custom_paint.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/search_view_content.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [BuildCustomPaint(), SearchViewContent()]);
  }
}
