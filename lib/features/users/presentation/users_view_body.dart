import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/users/presentation/view/users_view.dart';
import 'package:sadio_mane_store/features/users/presentation/widgets/user_view_table.dart';
import 'package:sadio_mane_store/features/users/presentation/widgets/user_view_text_form_field.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UsersBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: RefreshIndicator(
        onRefresh: () async {
          userBloc.add(GetUsersEvent());
          userBloc.searchController.clear();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: verticalSpace(10)),
            SliverToBoxAdapter(
              child: UsersViewTextFormField(userBloc: userBloc),
            ),
            SliverToBoxAdapter(child: verticalSpace(20)),
            const SliverToBoxAdapter(child: UsersViewTable()),
            const SliverToBoxAdapter(child: UsersBolcListener()),
          ],
        ),
      ),
    );
  }
}
