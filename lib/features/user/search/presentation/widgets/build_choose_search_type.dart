import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/search/presentation/bloc/search_bloc.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';

class BuildChooseSearchType extends StatelessWidget {
  const BuildChooseSearchType({super.key, required this.type});
  final SearchType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildChooseSearchTypeButton(
          type: SearchType.name,
          buttonName: 'Search By Name',
          context: context,
        ),
        _buildChooseSearchTypeButton(
          type: SearchType.price,
          buttonName: 'Search By Price',
          context: context,
        ),
      ],
    );
  }

  Widget _buildChooseSearchTypeButton({
    required String buttonName,
    required BuildContext context,
    required SearchType type,
  }) {
    final searchBloc = context.read<SearchBloc>();
    return GestureDetector(
      onTap: () {
        searchBloc.add(ChangeSearchTypeEvent(type: type));
      },
      child: Container(
        width: 150.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: this.type == type
              ? context.theme.appColors.containerLinear1
              : context.theme.appColors.containerLinear2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(buttonName, style: const TextStyle(fontSize: 17)),
        ),
      ),
    );
  }
}
