import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/users/presentation/widgets/user_view_table.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<UsersBloc>().add(GetUsersEvent());
        },
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
      ),
    );
  }
}
