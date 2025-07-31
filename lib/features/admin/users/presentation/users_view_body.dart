import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/widgets/user_view_table.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/widgets/user_view_text_form_field.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/widgets/users_bloc_listener.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UsersBloc>();
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 20.h),
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
