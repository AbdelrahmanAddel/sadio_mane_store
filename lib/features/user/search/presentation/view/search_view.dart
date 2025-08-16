import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/features/user/search/presentation/bloc/search_bloc.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: const CustomAppButton(child: Icon(Icons.arrow_back_ios_new)),
        ),
        title: Text(context.tr.search, style: const TextStyle(fontSize: 30)),
      ),
      body: BlocProvider(
        create: (context) => getIt<SearchBloc>(),
        child: const SearchViewBody(),
      ),
    );
  }
}
