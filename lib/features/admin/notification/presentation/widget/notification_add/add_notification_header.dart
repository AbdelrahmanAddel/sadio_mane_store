import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/widget/notification_view/notification_bottom_sheet_content_sheet.dart';

class AddNotificationHeader extends StatelessWidget {
  const AddNotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Notification', style: context.theme.textTheme.titleLarge),
        CustomAppButton(
          width: 110,
          child: const Text('Add'),
          onTap: () {
            context.read<NotificationBloc>().clearAllControllers();
            return addNotificationBottomSheet(
              context,
              BlocProvider.value(
                value: context.read<NotificationBloc>(),
                child: const NotificationBottomSheetContent(isEdit: false),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<dynamic> addNotificationBottomSheet(
    BuildContext context,
    Widget buttonWidget,
  ) {
    return customShowModalBottomSheet(
      buttonWidget: buttonWidget,
      context: context,
    );
  }
}
