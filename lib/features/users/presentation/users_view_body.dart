import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/users/presentation/widgets/user_view_table.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(
            child: CustomTextFormField(hintText: 'Search For User'),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
          const SliverToBoxAdapter(child: UsersViewTable()),
        ],
      ),
    );
  }
}
